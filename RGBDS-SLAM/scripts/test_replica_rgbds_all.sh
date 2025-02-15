#!/bin/bash

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office0.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/office0 \
    ../results/replica_rgbd_0/office0 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office1.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/office1 \
    ../results/replica_rgbd_0/office1 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office2.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/office2 \
    ../results/replica_rgbd_0/office2 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office3.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/office3 \
    ../results/replica_rgbd_0/office3 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office4.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/office4 \
    ../results/replica_rgbd_0/office4 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room0.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/room0 \
    ../results/replica_rgbd_0/room0 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room1.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/room1 \
    ../results/replica_rgbd_0/room1 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room2.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    /workspace/data/Replica/room2 \
    ../results/replica_rgbd_0/room2 \
    no_viewer
