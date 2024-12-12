# RGBDS-SLAM

[**RGBDS-SLAM: A RGB-D Semantic Dense SLAM Based on 3D Multi Level Pyramid Gaussian Splatting**](https://arxiv.org/pdf/2412.01217) <br>
[Zhenzhong Cao](https://zhenzhongcao.github.io/)<sup>123</sup>,  Jingtai Liu<sup>123</sup> <br>

Institute of Robotics and Automatic Information System, Nankai University, Tianjin 300350, China<sup>1</sup> <br>
Tianjin Key Laboratory of Intelligent Robotics, Tianjin 300350, China<sup>2</sup> <br>
TBI center, Nankai University, Tianjin 300350, China<sup>3</sup> <br>

<img src="https://github.com/zhenzhongcao/RGBDS-SLAM/blob/main/demo/demo1-office4.gif" alt="demo1-room0" width="49%">
<img src="https://github.com/zhenzhongcao/RGBDS-SLAM/blob/main/demo/demo1-room0.gif" alt="demo1-office4" width="49%">

<!-- ![image](https://github.com/zhenzhongcao/RGBDS-SLAM/blob/main/demo/RGBDS-SLAM.gif "rgbds-slam") -->

<br>

Our code will be open source soon!

## Prerequisites
```
# You can configure the environment required by our code by building a docker image
docker build -t rgbds-slam:v1 .
```

## Results Download

You can download our results in google drive: [results](https://drive.google.com/file/d/1Ksz1fA6a7VpWZ8ifL41SSZxVdjmtO-ax/view?usp=sharing)


## Results Evaluation
```
# You can reimplement our results using the sh script file in the evaluation folder

./evl_metrics.sh

./evl_depth.sh

./evl_mIoU.sh

./evl_ate.sh

./evl_time.sh
```

## Acknowledgement
Our work is based on [Photo-SLAM](https://github.com/HuajianUP/Photo-SLAM), and by using or modifying this work further, you agree to adhere to their terms of usage and include the license file. We extend our sincere gratitude for their outstanding contributions.

## Citation
```
@article{cao2024rgbds,
  title={RGBDS-SLAM: A RGB-D Semantic Dense SLAM Based on 3D Multi Level Pyramid Gaussian Splatting},
  author={Cao, Zhenzhong},
  journal={arXiv preprint arXiv:2412.01217},
  year={2024}
}
```