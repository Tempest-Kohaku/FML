#!/bin/bash

# Usage:
#   ./testone.sh MODEL_MODE CHECKPOINT_PATH

MODEL_MODE="$1"       # e.g. tf_efficientnet_b0
MODEL_PATH="$2"       # e.g. Knife-Effb0-RandRot/Knife-tf_efficientnet_b0-E10.pth
shift 2               # remove first 2 arguments

STUDENT_ID=6942852 STUDENT_NAME="Manas Negi" python Testing.py \
  --model_mode "${MODEL_MODE}" \
  --model-path "${MODEL_PATH}" \
  --dataset_location EEEM066_KnifeHunter \
  --test_datacsv dataset/test.csv \
  --batch_size 32 \
  --n_classes 543 \
  --resized_img_weight 224 \
  --resized_img_height 224 \
  --seed 0 \
  --evaluate-only \
  "$@"
