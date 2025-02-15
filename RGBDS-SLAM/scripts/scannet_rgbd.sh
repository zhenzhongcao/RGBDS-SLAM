#!/bin/bash

CUDA_VISIBLE_DEVICES=1 ../bin/scannet_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Scannet/scene0000_00.yaml \
    ../cfg/gaussian_mapper/RGB-D/Scannet/scannet_rgbd.yaml \
    /workspace/data/Scannet/scene0000_00/ \
    ../results/scannet_rgbd_0/scene0000_00 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/scannet_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Scannet/scene0169_00.yaml \
    ../cfg/gaussian_mapper/RGB-D/Scannet/scannet_rgbd.yaml \
    /workspace/data/Scannet/scene0169_00/ \
    ../results/scannet_rgbd_0/scene0169_00 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/scannet_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Scannet/scene0181_00.yaml \
    ../cfg/gaussian_mapper/RGB-D/Scannet/scannet_rgbd.yaml \
    /workspace/data/Scannet/scene0181_00/ \
    ../results/scannet_rgbd_0/scene0181_00 \
    no_viewer

CUDA_VISIBLE_DEVICES=1 ../bin/scannet_rgbds \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Scannet/scene0207_00.yaml \
    ../cfg/gaussian_mapper/RGB-D/Scannet/scannet_rgbd.yaml \
    /workspace/data/Scannet/scene0207_00/ \
    ../results/scannet_rgbd_0/scene0207_00 \
    no_viewer