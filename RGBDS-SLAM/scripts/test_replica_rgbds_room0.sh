#!/bin/bash

# ../bin/replica_rgbd \
#     ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
#     ../cfg/ORB_SLAM3/RGB-D/Replica/office0.yaml \
#     ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
#     /home/czz/czz/Dataset/Replica/office0 \
#     ../results/replica_rgbd_0/office0

../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room0s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /home/czz/czz/Dataset/Replica/room0 \
    ../results/replica_rgbd_0/room0 \