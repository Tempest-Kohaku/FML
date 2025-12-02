#!/bin/bash
set -e  # stop immediately if any test fails

echo "Starting chained testing at $(date)"
echo

# =========== Section 2 Testing (Augment Experiments) ===========

# 1 - Rotation only
./testone.sh tf_efficientnet_b0 "Knife-Effb0-RandRot/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec2_q1_rot.txt

# 2 - Horizontal Flip only
./testone.sh tf_efficientnet_b0 "Knife-Effb0-HoriFlip/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec2_q1_flip.txt

# 3 - Rotation + Horizontal Flip
./testone.sh tf_efficientnet_b0 "Knife-Effb0-RandRotHoriFlip/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec2_q2_rotflip.txt



# =========== Section 3 Testing (LR Experiments) ===========

./testone.sh tf_efficientnet_b0 "Knife-Effb0-LR1/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q1_lr1.txt

./testone.sh tf_efficientnet_b0 "Knife-Effb0-LR2/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q1_lr2.txt

./testone.sh tf_efficientnet_b0 "Knife-Effb0-LR3/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q1_lr3.txt



# =========== Section 3 Testing (Batch Size Experiments) ===========

# ./testone.sh tf_efficientnet_b0 "Knife-Effb0-Batch16/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q2_bs16.txt

# ./testone.sh tf_efficientnet_b0 "Knife-Effb0-Batch64/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q2_bs64.txt

# ./testone.sh tf_efficientnet_b0 "Knife-Effb0-Batch128/Knife-tf_efficientnet_b0-E10.pth" \
    | tee log_test_sec3_q2_bs128.txt


echo
echo "All tests finished at $(date)"
