# RGBDS-SLAM

**RGBDS-SLAM: A RGB-D Semantic Dense SLAM Based on 3D Multi Level Pyramid Gaussian Splatting** <br>
[Zhenzhong Cao](https://zhenzhongcao.github.io/)<sup>123</sup>,  Jingtai Liu<sup>123</sup> <br>

Institute of Robotics and Automatic Information System, Nankai University, Tianjin 300350, China<sup>1</sup> <br>
Tianjin Key Laboratory of Intelligent Robotics, Tianjin 300350, China<sup>2</sup> <br>
TBI center, Nankai University, Tianjin 300350, China<sup>3</sup> <br>

![image](https://github.com/zhenzhongcao/RGBDS-SLAM/blob/main/demo/RGBDS-SLAM.gif "rgbds-slam")<br>

Our code will be open source soon!

## Prerequisites
```
# You can configure the environment required by our code by building a docker image
docker build -t rgbds-slam:v1 .
```

## Results Evaluation
```
# You can reimplement our results using the sh script file in the evaluation folder

./evl_metrics.sh

./evl_depth.sh

./evl_mIoU.sh

./evl_ate.sh

./evl_time.sh
```