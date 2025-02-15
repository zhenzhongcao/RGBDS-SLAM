import torch
import numpy as np
from PIL import Image
import torchvision.transforms as T

def read_image(image_path):
    """
    读取图像文件并转换为 torch tensor。
    
    参数：
        image_path: 图像文件的路径
    
    返回：
        torch tensor: 形状为 (C, H, W) 的图像，C 为通道数，H 和 W 为图像的高和宽。
    """
    # 打开图像
    image = Image.open(image_path).convert("RGB")
    
    # 将图像转换为 tensor
    transform = T.ToTensor()
    image_tensor = transform(image)
    
    # 添加 batch 维度，并确保通道数为 3 (RGB)
    return image_tensor.unsqueeze(0).permute(0, 3, 1, 2).squeeze(0)  # 转换为 (C, H, W)

def evaluate_miou(recolored_img, gt_img):
    """
    计算两张彩色图像之间的 mIoU（Mean Intersection over Union）。
    
    输入：
        recolored_img: 预测的彩色语义图像，形状为 (C, H, W)
        gt_img: 真实标签的彩色语义图像，形状为 (C, H, W)
    
    输出：
        mIoU: 平均交并比（mean IoU）
    """
    # 将图像展平成 (H*W, 3) 的形式
    gt_flat = gt_img.permute(1, 2, 0).view(-1, 3)
    pred_flat = recolored_img.permute(1, 2, 0).view(-1, 3)

    # 过滤掉未标记的像素 [0, 0, 0] （背景类）
    labeled_pixels = (gt_flat != torch.tensor([0, 0, 0], dtype=torch.uint8).cuda()).any(dim=1)
    gt_flat = gt_flat[labeled_pixels]
    pred_flat = pred_flat[labeled_pixels]

    # 获取真实图像中所有唯一的颜色（类别）
    unique_colors = torch.unique(gt_flat, dim=0)
    iou_per_color = []

    for color in unique_colors:
        # 跳过背景类 [0, 0, 0]
        if torch.equal(color, torch.tensor([0, 0, 0], dtype=torch.uint8).cuda()):
            continue

        # 获取与当前颜色匹配的像素位置
        gt_matches = torch.all(gt_flat == color, dim=1)
        pred_matches = torch.all(pred_flat == color, dim=1)

        # 计算交集和并集
        intersection = torch.logical_and(gt_matches, pred_matches).sum().item()
        union = torch.logical_or(gt_matches, pred_matches).sum().item()

        if union == 0:
            continue

        # 计算 IoU
        iou = intersection / union
        iou_per_color.append(iou)

    # 计算平均 IoU
    miou = sum(iou_per_color) / len(iou_per_color) if iou_per_color else 0
    return miou


# 读取图像路径  /home/czz/Code/RGBDS-SLAM/Photo-SLAM-RGBDS/results/replica_rgbd_0/office0/30081_shutdown/semantic_image/30081_0.jpg
# /home/czz/Code/RGBDS-SLAM/Photo-SLAM-RGBDS/results/replica_rgbd_0/office0/30081_shutdown/semantic_image_gt
gt_image_path = '../results/replica_rgbd_0/office0/30081_shutdown/semantic_image_gt/30081_0_gt.jpg'  # 真实标签图像路径
recolored_image_path = '../results/replica_rgbd_0/office0/30081_shutdown/semantic_image/30081_0.jpg'  # 预测标签图像路径

# 读取图像
gt_img = read_image(gt_image_path).cuda()  # 读取真实标签图像
recolored_img = read_image(recolored_image_path).cuda()  # 读取预测标签图像

# 计算 mIoU
miou = evaluate_miou(recolored_img, gt_img)
print(f"Mean IoU: {miou:.4f}")
