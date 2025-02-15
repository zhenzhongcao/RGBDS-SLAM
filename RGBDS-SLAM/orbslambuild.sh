# ORB-SLAM3
echo "Building ORB-SLAM3 ..."
cd ./ORB-SLAM3/build

cmake .. -DCMAKE_BUILD_TYPE=Release # add OpenCV_DIR definitions if needed, example:
#cmake .. -DCMAKE_BUILD_TYPE=Release -DOpenCV_DIR=/home/rapidlab/libs/opencv/lib/cmake/opencv4
make -j8

# Photo-SLAM
echo "Building Photo-SLAM ..."
cd ../..
mkdir build
cd build
#cmake .. # add Torch_DIR and/or OpenCV_DIR definitions if needed, example:
cmake .. -DTorch_DIR=/home/czz/czz/Library/libtorch2.0.1+cu11.8/libtorch/share/cmake/Torch
make -j8
