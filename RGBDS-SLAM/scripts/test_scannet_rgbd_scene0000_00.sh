#!/bin/bash

../bin/scannet_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Scannet/scene0000_00.yaml \
    ../cfg/gaussian_mapper/RGB-D/Scannet/scannet_rgbd.yaml \
    /home/czz/czz/Dataset/ScanNet/scene0000_00/ \
    ../results/scannet_0/scene0000_00

# ../bin/replica_rgbd \
#     ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
#     ../cfg/ORB_SLAM3/RGB-D/Replica/room0.yaml \
#     ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
#     /home/czz/czz/Dataset/Replica/room0 \
#     ../results/replica_rgbd_0/room0 \