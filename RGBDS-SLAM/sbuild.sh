# Photo-SLAM
echo "Building Photo-SLAM ..."
cd  build
#cmake .. # add Torch_DIR and/or OpenCV_DIR definitions if needed, example:
cmake .. -DTorch_DIR=/home/czz/czz/Library/libtorch2.0.1+cu11.8/libtorch/share/cmake/Torch
make -j8
