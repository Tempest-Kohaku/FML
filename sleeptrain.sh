#!/bin/bash

# Usage examples
#   ./train.sh tf_efficientnet_b0 Knife-Effb0-RandRot --random_rotation 360

MODEL_MODE="$1"
CKPT_PATH="$2"
shift 2  # remove the first two args so $@ now only has extra options

STUDENT_ID=6942852 STUDENT_NAME="Manas Negi" python Training.py \
  --model_mode "${MODEL_MODE}" \
  --dataset_location EEEM066_KnifeHunter \
  --train_datacsv dataset/train.csv \
  --val_datacsv dataset/validation.csv \
  --saved_checkpoint_path "${CKPT_PATH}" \
  --epochs 10 \
  --batch_size 32 \
  --n_classes 543 \
  --resized_img_weight 224 \
  --resized_img_height 224 \
  --seed 0 \
  --brightness 0.2 \
  --contrast 0.2 \
  --saturation 0.2 \
  --hue 0.2 \
  --optim adam \
  --lr-scheduler CosineAnnealingLR \
  "$@"
