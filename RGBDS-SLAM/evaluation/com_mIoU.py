import os
import torch
import argparse
import numpy as np
from PIL import Image
import torchvision.transforms as T
from pathlib import Path

def read_image(image_path):
    """
    读取图像文件并转换为 torch tensor。
    
    参数：
        image_path: 图像文件的路径
    
    返回：
        torch tensor: 形状为 (H, W) 的单通道灰度图像。
    """
    # 打开图像
    image = Image.open(image_path).convert("RGB")
    
    # 将图像转换为 tensor
    transform = T.ToTensor()
    image_tensor = transform(image)
    
    # 转换为灰度图像（加权平均）
    gray_image = image_tensor[0] * 0.2989 + image_tensor[1] * 0.5870 + image_tensor[2] * 0.1140
    
    # 返回单通道灰度图像
    return gray_image.squeeze(0)  # 转换为 (H, W)

def evaluate_miou(pred_img, gt_img, threshold=10):
    """
    计算两张灰度图像之间的 mIoU（Mean Intersection over Union），逐像素计算。
    
    输入：
        pred_img: 预测的灰度图像，形状为 (H, W)
        gt_img: 真实标签的灰度图像，形状为 (H, W)
        threshold: 像素值差异小于该值时认为两个像素匹配
    
    输出：
        mIoU: 平均交并比（mean IoU）
    """
    # 将图像展平为一维数组
    gt_flat = gt_img.view(-1)
    pred_flat = pred_img.view(-1)

    # 过滤掉未标记的像素（假设0为背景）
    valid_pixels = gt_flat != 0  # 假设0是背景
    gt_flat = gt_flat[valid_pixels]
    pred_flat = pred_flat[valid_pixels]

    # 计算交集和并集
    # 判断像素差值是否小于阈值
    diff = torch.abs(gt_flat - pred_flat) < threshold  # 允许小的差异
    intersection = diff.sum().item()  # 计算交集（匹配的像素）
    union = (gt_flat != 0).sum().item() + (pred_flat != 0).sum().item() - intersection  # 计算并集

    if union == 0:
        return 0

    # 计算 IoU
    iou = intersection / union
    return iou

def calculate_average_miou(gt_folder_path, pred_folder_path, threshold=10):
    """
    计算两个文件夹中所有对应图像的平均 mIoU。
    
    输入：
        gt_folder: 真实标签图像文件夹路径
        pred_folder: 预测标签图像文件夹路径
        threshold: 像素值差异小于该值时认为两个像素匹配
    
    输出：
        average_miou: 所有对应图像对的平均 mIoU
    """
    pred_folder = Path(pred_folder_path)  # 渲染图像文件夹路径
    gt_folder = Path(gt_folder_path)  # 真实图像文件夹路径
    gt_images = {file.stem: file for file in gt_folder.glob('*.jpg')}  # 创建一个字典以便通过文件名快速访问
    pred_images = sorted(pred_folder.glob('*.jpg'))

    if len(gt_images) != len(pred_images):
        raise ValueError("The number of images in the two folders does not match.")

    total_miou = 0
    count = 0
    
    for pred_image in pred_images:
        # 构建真实图像的文件名
        gt_image_key = pred_image.stem + '_gt'
        if gt_image_key in gt_images:
            # 读取图像并转换为灰度图
            #print(pred_image, gt_images[gt_image_key])
            gt_img = read_image(gt_images[gt_image_key]).cuda()  # 读取真实标签图像并转换为灰度图
            pred_img = read_image(pred_image).cuda()  # 读取预测标签图像并转换为灰度图

            # 计算每对图像的 mIoU
            miou = evaluate_miou(pred_img, gt_img, threshold)
            total_miou += miou
            count += 1

    # 计算平均 mIoU
    average_miou = total_miou / count if count > 0 else 0
    return average_miou*100

def main():
    # 设置命令行参数解析器
    parser = argparse.ArgumentParser(description="Calculate the average mIoU of corresponding images in two folders.")
    
    # 定义文件夹路径参数
    parser.add_argument('--gt_folder', type=str, required=True, help="Path to the ground truth folder")
    parser.add_argument('--pred_folder', type=str, required=True, help="Path to the predicted folder")
    parser.add_argument('--threshold', type=float, default=0.1, help="Threshold for pixel difference to be considered a match")

    # 解析命令行参数
    args = parser.parse_args()

    # 获取文件夹路径和阈值
    gt_folder = args.gt_folder
    pred_folder = args.pred_folder
    threshold = args.threshold

    # 计算平均 mIoU
    average_miou = calculate_average_miou(gt_folder, pred_folder, threshold)  # 计算平均 mIoU
    print(f"Average mIoU: {average_miou:.4f}")

if __name__ == "__main__":
    main()
