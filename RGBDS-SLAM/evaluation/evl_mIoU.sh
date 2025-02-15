echo "room0"
python3 com_mIoU.py --pred_folder ../results/replica_rgbd_0/room0/*_shutdown/semantic_image --gt_folder ../results/replica_rgbd_0/room0/*_shutdown/semantic_image_gt --threshold 0.01


echo "room1"
python3 com_mIoU.py --pred_folder ../results/replica_rgbd_0/room1/*_shutdown/semantic_image --gt_folder ../results/replica_rgbd_0/room1/*_shutdown/semantic_image_gt --threshold 0.01


echo "room2"
python3 com_mIoU.py --pred_folder ../results/replica_rgbd_0/room2/*_shutdown/semantic_image --gt_folder ../results/replica_rgbd_0/room2/*_shutdown/semantic_image_gt --threshold 0.01


echo "office0"
python3 com_mIoU.py --pred_folder ../results/replica_rgbd_0/office0/*_shutdown/semantic_image --gt_folder ../results/replica_rgbd_0/office0/*_shutdown/semantic_image_gt --threshold 0.01



