import torch

def calculate_l1_error_mid_depth(image1, image2):
    """
    计算两张灰度图像的 L1 误差，仅使用深度值排序后中间 3/5 的数据。
    
    参数:
    - image1: torch.Tensor，第一张灰度图像，形状为 (H, W)。
    - image2: torch.Tensor，第二张灰度图像，形状为 (H, W)。

    返回:
    - l1_error: 中间 3/5 数据的 L1 误差。
    """
    if image1.shape != image2.shape:
        raise ValueError("两张图像的形状不一致！")

    # 确保输入是浮点型张量
    image1 = image1.float()
    image2 = image2.float()

    # 计算每个像素的绝对误差
    absolute_diff = torch.abs(image1 - image2)

    # 将深度值排序
    sorted_diff, _ = torch.sort(absolute_diff.view(-1))

    # 仅使用中间 3/5 的数据
    total_pixels = sorted_diff.size(0)
    start_idx = total_pixels // 5  # 排除前 1/5
    end_idx = total_pixels * 4 // 5  # 排除后 1/5

    mid_diff = sorted_diff[start_idx:end_idx]

    # 计算中间 3/5 数据的 L1 误差
    l1_error = torch.sum(mid_diff)

    return l1_error

# 示例用法
if __name__ == "__main__":
    # 随机生成两张灰度图像
    torch.manual_seed(0)
    image1 = torch.randint(0, 256, (256, 256), dtype=torch.uint8)
    image2 = torch.randint(0, 256, (256, 256), dtype=torch.uint8)

    # 计算 L1 误差
    l1_error = calculate_l1_error_mid_depth(image1, image2)
    print(f"中间 3/5 数据的 L1 误差: {l1_error}")
