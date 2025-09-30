# 1. 設定你的最佳模型路徑
# export CKPT_PATH="logs/finetune/Cls/fatty_liver/vit/usfm_fatty_liver_exp1/2025-09-30_10-34-43/outputs/best_ckpt.pth"
# export CKPT_PATH="logs/finetune/Cls/fatty_liver/vit/usfm_fatty_liver_exp2/2025-09-30_11-56-01/outputs/best_ckpt.pth"
# export CKPT_PATH="logs/finetune/Cls/fatty_liver/vit/usfm_fatty_liver_exp3/2025-09-30_13-50-07/outputs/best_ckpt.pth"
export CKPT_PATH="logs/finetune/Cls/fatty_liver/vit/usfm_fatty_liver_exp4/2025-09-30_14-09-53/outputs/best_ckpt.pth"

# 2. 設定你的資料集名稱
export DATASET_NAME="fatty_liver"

# 3. 執行最終的、完全修正的測試指令
echo "🧪 Starting final testing..."
echo "Model checkpoint: $CKPT_PATH"

python main.py \
    experiment=task/Cls \
    data=Cls/$DATASET_NAME \
    model=Cls/vit \
    mode=test \
    model.resume=$CKPT_PATH