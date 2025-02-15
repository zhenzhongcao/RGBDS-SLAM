import torch
import lpips
import numpy as np
from PIL import Image
from pathlib import Path
import argparse
import warnings
warnings.filterwarnings("ignore")


# 函数：加载图片并转换为PyTorch的Tensor格式
def load_image_as_tensor(image_path):
    image = Image.open(image_path).convert('RGB')
    image_tensor = torch.tensor(np.array(image)).permute(2, 0, 1).unsqueeze(0).float() / 255.0
    return image_tensor

def main(rendered_folder_path, real_folder_path):
    # 文件夹路径
    rendered_folder = Path(rendered_folder_path)  # 渲染图像文件夹路径
    real_folder = Path(real_folder_path)  # 真实图像文件夹路径

    # 加载预训练的LPIPS模型
    lpips_model = lpips.LPIPS(net='alex')

    # 获取文件列表
    rendered_files = sorted(rendered_folder.glob('*.jpg'))  # 根据需要调整文件类型
    real_files = {file.stem: file for file in real_folder.glob('*.jpg')}  # 创建一个字典以便通过文件名快速访问

    # 计算所有图像对的LPIPS并取平均值
    total_lpips = 0.0
    count = 0

    for rendered_file in rendered_files:
        # 构建真实图像的文件名
        real_file_key = rendered_file.stem + '_gt'
        if real_file_key in real_files:
            rendered_image_tensor = load_image_as_tensor(rendered_file)
            real_image_tensor = load_image_as_tensor(real_files[real_file_key])
            distance = lpips_model(rendered_image_tensor, real_image_tensor)
            total_lpips += distance.item()
            count += 1

    average_lpips = total_lpips / count if count > 0 else 0
    print(f'Average LPIPS score across all corresponding images: {average_lpips}')

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Calculate average LPIPS between two folders of images.")
    parser.add_argument("rendered_folder_path", type=str, help="Path to the folder containing rendered images.")
    parser.add_argument("real_folder_path", type=str, help="Path to the folder containing real images.")
    
    args = parser.parse_args()
    
    main(args.rendered_folder_path, args.real_folder_path)
