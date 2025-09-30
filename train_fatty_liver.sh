#!/bin/bash

# =========================================================================
# USFM 模型訓練腳本
# =========================================================================

# --- 1. 可修改的訓練參數 ---
# 在這裡修改你想訓練的資料集和超參數

# 【修改這裡】設定你的資料集名稱 (e.g., "fatty_liver" 或 "fibrosis")
DATASET_NAME="fatty_liver"

# 【修改這裡】設定訓練的總輪數 (Epochs)
EPOCHS=200

# 【修改這裡】設定批次大小 (Batch Size)，RTX 4090 可以嘗試 32 或 64
BATCH_SIZE=32

# 【修改這裡】為這次的實驗取一個獨特的標籤 (tag)，結果會存在對應的資料夾
EXP_TAG="usfm_${DATASET_NAME}_exp2"


# --- 2. 硬體與路徑設定 (通常不需要修改) ---

# 根據 nvidia-smi 的結果，我們使用第 0 號 GPU
export CUDA_VISIBLE_DEVICES=0
# GPU 總數為 1
export devices=1

# 資料讀取的執行緒數量
export num_workers=4

# 預訓練權重的路徑
export pretrained_path=./assets/FMweight/USFM_latest.pth

# 任務與模型設定 (分類任務)
export task=Cls
export model=Cls/vit


# --- 3. 執行訓練指令 ---

echo "====================================================="
echo "🚀 Starting USFM Training"
echo "➡️   Dataset: $DATASET_NAME"
echo "➡️   Epochs: $EPOCHS"
echo "➡️   Batch Size: $BATCH_SIZE"
echo "➡️   Experiment Tag: $EXP_TAG"
echo "➡️   Using GPU: $CUDA_VISIBLE_DEVICES"
echo "====================================================="

python main.py experiment=task/$task data=Cls/$DATASET_NAME \
    data="{batch_size:$BATCH_SIZE,num_workers:$num_workers}" \
    model=$model \
    model.model_cfg.backbone.pretrained=$pretrained_path \
    train="{epochs:$EPOCHS, accumulation_steps:1}" \
    L="{devices:$devices}" \
    tag=$EXP_TAG

echo "✅ Training finished!"