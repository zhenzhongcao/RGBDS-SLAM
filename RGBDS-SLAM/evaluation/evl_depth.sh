echo "office0"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/office0/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office0/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/office0/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office0/CameraTrajectory_TUM.txt
python3 com_depth.py  ../results/replica_rgbd_0/office0/*_shutdown/depth_image  ../results/replica_rgbd_0/office0/*_shutdown/depth_image_gt

echo "office1"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/office1/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office1/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/office1/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office1/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/office1/*_shutdown/depth_image  ../results/replica_rgbd_0/office1/*_shutdown/depth_image_gt

echo "office2"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/office2/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office2/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/office2/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office2/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/office2/*_shutdown/depth_image  ../results/replica_rgbd_0/office2/*_shutdown/depth_image_gt

echo "office3"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/office3/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office3/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/office3/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office3/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/office3/*_shutdown/depth_image  ../results/replica_rgbd_0/office3/*_shutdown/depth_image_gt

echo "office4"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/office4/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office4/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/office4/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/office4/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/office4/*_shutdown/depth_image  ../results/replica_rgbd_0/office4/*_shutdown/depth_image_gt


echo "room0"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/room0/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room0/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/room0/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room0/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/room0/*_shutdown/depth_image  ../results/replica_rgbd_0/room0/*_shutdown/depth_image_gt

echo "room1"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/room1/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room1/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/room1/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room1/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/room1/*_shutdown/depth_image  ../results/replica_rgbd_0/room1/*_shutdown/depth_image_gt

echo "room2"
#python2 evaluate_ate.py /home/czz/czz/Dataset/Replica/room2/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room2/CameraTrajectory_TUM.txt
#python2 evaluate_rpe.py /home/czz/czz/Dataset/Replica/room2/groundtruth.txt /home/czz/czz/Code/GS/Photo-SLAM/results/replica_rgbd_0/room2/CameraTrajectory_TUM.txt
python3 com_depth.py ../results/replica_rgbd_0/room2/*_shutdown/depth_image  ../results/replica_rgbd_0/room2/*_shutdown/depth_image_gt


