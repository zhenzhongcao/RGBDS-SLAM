#!/bin/bash

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office0s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/office0 \
    ../results/replica_rgbd_0/office0 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office1s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/office1 \
    ../results/replica_rgbd_0/office1 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office2s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/office2 \
    ../results/replica_rgbd_0/office2 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office3s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/office3 \
    ../results/replica_rgbd_0/office3 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office4s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/office4 \
    ../results/replica_rgbd_0/office4 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room0s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/room0 \
    ../results/replica_rgbd_0/room0 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room1s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/room1 \
    ../results/replica_rgbd_0/room1 \
    no_viewer

CUDA_VISIBLE_DEVICES=0 ../bin/replica_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room2s.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbds.yaml \
    /workspace/data/Replica/room2 \
    ../results/replica_rgbd_0/room2 \
    no_viewer
