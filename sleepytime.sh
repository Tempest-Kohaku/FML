#!/bin/bash
set -e  # stop if one run fails

echo "Starting chained training runs at $(date)"
echo

# 1 - tf_efficientnet_b0, rotation only
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-RandRot --random_rotation 360 --learning_rate 0.00005

# # 2 - tf_efficientnet_b0, horizontal flip only
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-HoriFlip --horizontal_flip 0.5 --learning_rate 0.00005

# # 3 - tf_efficientnet_b0, rotation + horizontal flip
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-RandRotHoriFlip --random_rotation 360 --horizontal_flip 0.5 --learning_rate 0.00005

# # 4 - Different Learning Rates
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-LR1 --learning_rate 0.0002 
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-LR2 --learning_rate 0.0004
./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-LR3 --learning_rate 0.0005

## 5 - Different Batch Sizes
# ./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-Batch16 --batch_size 16
# ./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-Batch64 --batch_size 64
# ./sleeptrain.sh tf_efficientnet_b0 Knife-Effb0-Batch8 --batch_size 8


echo
echo "All training runs finished at $(date)"
