# 1. 設定你的最佳模型路徑
# export CKPT_PATH="logs/finetune/Cls/fibrosis/vit/usfm_fibrosis_exp1/2025-09-30_11-11-00/outputs/best_ckpt.pth"
# export CKPT_PATH="logs/finetune/Cls/fibrosis/vit/usfm_fibrosis_exp4/2025-09-30_12-08-30/outputs/best_ckpt.pth"
export CKPT_PATH="logs/finetune/Cls/fibrosis/vit/usfm_fibrosis_exp5/2025-09-30_14-44-42/outputs/best_ckpt.pth"

# 2. 設定你的資料集名稱
export DATASET_NAME="fibrosis"

# 3. 執行最終的、完全修正的測試指令
echo "🧪 Starting final testing..."
echo "Model checkpoint: $CKPT_PATH"

python main.py \
    experiment=task/Cls \
    data=Cls/$DATASET_NAME \
    model=Cls/vit \
    mode=test \
    model.resume=$CKPT_PATH