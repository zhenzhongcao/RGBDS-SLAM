/**
 * This file is part of Photo-SLAM
 *
 * Copyright (C) 2023-2024 Longwei Li and Hui Cheng, Sun Yat-sen University.
 * Copyright (C) 2023-2024 Huajian Huang and Sai-Kit Yeung, Hong Kong University of Science and Technology.
 *
 * Photo-SLAM is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Photo-SLAM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with Photo-SLAM.
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <vector>

#include <torch/torch.h>

namespace loss_utils
{

inline torch::Tensor l1_loss(torch::Tensor &network_output, torch::Tensor &gt)
{
    return torch::abs(network_output - gt).mean();
}

inline torch::Tensor l1_loss_depth(torch::Tensor &network_output, torch::Tensor &gt)
{
    // 将 network_output 和 gt 转换为一维
    torch::Tensor network_output_flat = network_output.flatten();
    torch::Tensor gt_flat = gt.flatten();

    // 对两个张量求均值，生成总的深度张量
    torch::Tensor depth_values = (network_output_flat + gt_flat) / 2.0;

    // 对深度值排序，升序排列
    torch::Tensor sorted_depth_values, indices;
    std::tie(sorted_depth_values, indices) = depth_values.sort();

    // 计算前1/5和后1/5的深度值索引
    int64_t num_values = depth_values.size(0);
    int64_t lower_bound = num_values / 5;
    int64_t upper_bound = 4 * num_values / 5;

    // 创建掩码，保留中间3/5的深度值
    torch::Tensor mask = (indices >= lower_bound) & (indices < upper_bound);

    // 使用掩码选择有效的 network_output 和 gt
    torch::Tensor valid_network_output = network_output_flat.index_select(0, indices.masked_select(mask));
    torch::Tensor valid_gt = gt_flat.index_select(0, indices.masked_select(mask));

    // 计算 L1 误差，并取平均
    return torch::abs(valid_network_output - valid_gt).mean();
}


inline torch::Tensor psnr(torch::Tensor &img1, torch::Tensor &img2)
{
    auto mse = torch::pow(img1 - img2, 2).mean();
    return 10.0f * torch::log10(1.0f / mse);
}

/** def psnr(img1, img2):
 *     mse = (((img1 - img2)) ** 2).view(img1.shape[0], -1).mean(1, keepdim=True)
 *     return 20 * torch.log10(1.0 / torch.sqrt(mse))
 */
inline torch::Tensor psnr_gaussian_splatting(torch::Tensor &img1, torch::Tensor &img2)
{
    auto mse = torch::pow(img1 - img2, 2).view({img1.size(0) , -1}).mean(1, /*keepdim=*/true);
    return 20.0f * torch::log10(1.0f / torch::sqrt(mse)).mean();
}

inline torch::Tensor gaussian(
    int window_size,
    float sigma,
    torch::DeviceType device_type = torch::kCUDA)
{
    std::vector<float> gauss_values(window_size);
    for (int x = 0; x < window_size; ++x) {
        int temp = x - window_size / 2;
        gauss_values[x] = std::exp(-temp * temp / (2.0f * sigma * sigma));
    }
    torch::Tensor gauss = torch::tensor(
        gauss_values,
        torch::TensorOptions().device(device_type));
    return gauss / gauss.sum();
}

inline torch::autograd::Variable create_window(
    int window_size,
    int64_t channel,
    torch::DeviceType device_type = torch::kCUDA)
{
    auto _1D_window = gaussian(window_size, 1.5f, device_type).unsqueeze(1);
    auto _2D_window = _1D_window.mm(_1D_window.t()).to(torch::kFloat).unsqueeze(0).unsqueeze(0);
    auto window = torch::autograd::Variable(_2D_window.expand({channel, 1, window_size, window_size}).contiguous());
    return window;
}

inline torch::Tensor _ssim(
    torch::Tensor &img1,
    torch::Tensor &img2,
    torch::autograd::Variable &window,
    int window_size,
    int64_t channel,
    bool size_average = true)
{
    int window_size_half = window_size / 2;
    auto mu1 = torch::nn::functional::conv2d(img1, window, torch::nn::functional::Conv2dFuncOptions().padding(window_size_half).groups(channel));
    auto mu2 = torch::nn::functional::conv2d(img2, window, torch::nn::functional::Conv2dFuncOptions().padding(window_size_half).groups(channel));

    auto mu1_sq = mu1.pow(2);
    auto mu2_sq = mu2.pow(2);
    auto mu1_mu2 = mu1 * mu2;

    auto sigma1_sq = torch::nn::functional::conv2d(img1 * img1, window, torch::nn::functional::Conv2dFuncOptions().padding(window_size_half).groups(channel))
                    - mu1_sq;
    auto sigma2_sq = torch::nn::functional::conv2d(img2 * img2, window, torch::nn::functional::Conv2dFuncOptions().padding(window_size_half).groups(channel))
                    - mu2_sq;
    auto sigma12 = torch::nn::functional::conv2d(img1 * img2, window, torch::nn::functional::Conv2dFuncOptions().padding(window_size_half).groups(channel))
                    - mu1_mu2;

    auto C1 = 0.01 * 0.01;
    auto C2 = 0.03 * 0.03;

    auto ssim_map = ((2 * mu1_mu2 + C1) * (2 * sigma12 + C2)) / ((mu1_sq + mu2_sq + C1) * (sigma1_sq + sigma2_sq + C2));

    if (size_average)
        return ssim_map.mean();
    else
        return ssim_map.mean(1).mean(1).mean(1);
}

inline torch::Tensor ssim(
    torch::Tensor &img1,
    torch::Tensor &img2,
    torch::DeviceType device_type = torch::kCUDA,
    int window_size = 11,
    bool size_average = true)
{
    auto channel = img1.size(-3);
    auto window = create_window(window_size, channel, device_type);

    // window = window.to(img1.device());
    window = window.type_as(img1);

    return _ssim(img1, img2, window, window_size, channel, size_average);
}

}

// inline torch::nn::Sequential make_vgg_features() {
//     auto vgg = torch::vision::models::VGG16();
//     // Load pre-trained model weights
//     // You must provide path to the serialized model or use torchvision's API to download it
//     // vgb->load_state_dict(torch::load("vgg16.pth"));
    
//     torch::nn::Sequential features;
//     // We only use the first few layers for feature extraction
//     for (const auto& layer : vgg->features()->children()) {
//         features->push_back(layer);
//         if (layer->as<torch::nn::MaxPool2d>()) {
//             break; // stop after the first pooling layer
//         }
//     }
//     return features;
// }

// // Define a simple function to extract features using VGG network
// inline torch::Tensor extract_features(const torch::Tensor& img, torch::nn::Sequential& model) {
//     torch::NoGradGuard no_grad;
//     return model->forward(img.unsqueeze(0)).squeeze(0);
// }

// // Compute LPIPS using features extracted by a pretrained model
// inline torch::Tensor lpips(const torch::Tensor& img1, const torch::Tensor& img2) {
//     auto features_model = make_vgg_features();
//     torch::Tensor features1 = extract_features(img1, features_model);
//     torch::Tensor features2 = extract_features(img2, features_model);
//     return torch::norm(features1 - features2, 2);
// }

