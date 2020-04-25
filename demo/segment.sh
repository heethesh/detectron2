#!/bin/bash
# @Author: Heethesh Vhavle
# @Date:   Apr 24, 2020
# @Last Modified by:   Heethesh Vhavle
# @Last Modified time: Apr 24, 2020

####################################
# DATASET -- NETWORK -- WEIGHTS

# -- R50 FPN
# COCO-InstanceSegmentation -- mask_rcnn_R_50_FPN_3x -- 137849600/model_final_f10217.pkl
# LVIS-InstanceSegmentation -- mask_rcnn_R_50_FPN_1x -- 144219072/model_final_571f7c.pkl

# -- X101 (Need more GPU memory ~7GB)
# COCO-InstanceSegmentation -- mask_rcnn_X_101_32x8d_FPN_3x -- 139653917/model_final_2d9806.pkl
# LVIS-InstanceSegmentation -- mask_rcnn_X_101_32x8d_FPN_1x -- 144219108/model_final_5e3439.pkl

# -- Panoptic
# COCO-PanopticSegmentation -- panoptic_fpn_R_50_3x -- 139514569/model_final_c10459.pkl

####################################

# DATASET="LVIS-InstanceSegmentation"
# NETWORK="mask_rcnn_R_50_FPN_1x"
# WEIGHTS="144219072/model_final_571f7c.pkl"

DATASET="COCO-InstanceSegmentation"
NETWORK="mask_rcnn_R_50_FPN_3x"
WEIGHTS="137849600/model_final_f10217.pkl"

# DATASET="COCO-PanopticSegmentation"
# NETWORK="panoptic_fpn_R_50_3x"
# WEIGHTS="139514569/model_final_c10459.pkl"

####################################

INPUT="/home/heethesh/ROS-Workspaces/slam_ws/src/extracted_images/cafe1-1/*.png"
OUTPUT="/home/heethesh/ROS-Workspaces/slam_ws/src/annotated_images/cafe1-1/"
SCORES="/home/heethesh/ROS-Workspaces/slam_ws/src/SLAM-Project/data/scores.tsv"

####################################

python3 segment.py \
  --config-file "../configs/${DATASET}/${NETWORK}.yaml" \
  --input "${INPUT}" \
  --scores "${SCORES}" \
  --output "${OUTPUT}" \
  --opts MODEL.WEIGHTS "detectron2://${DATASET}/${NETWORK}/${WEIGHTS}"
