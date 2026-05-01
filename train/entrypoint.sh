#!/bin/bash
set -e

# Define model paths using environment variable with fallback
OUTPUT_DIR="${MODEL_OUTPUT_DIR:-/app/../models}"
MODEL_FILE="$OUTPUT_DIR/celiac_risk_model.pkl"
METADATA_FILE="$OUTPUT_DIR/model_metadata.pkl"
NOTEBOOK_FILE="${TRAIN_NOTEBOOK_FILE:-model_training_pipeline.ipynb}"
EXECUTED_NOTEBOOK_FILE="${TRAIN_EXECUTED_NOTEBOOK_FILE:-model_training_pipeline.executed.ipynb}"

run_training_notebook() {
    echo "Executing training notebook: $NOTEBOOK_FILE"
    jupyter nbconvert \
        --to notebook \
        --execute "$NOTEBOOK_FILE" \
        --ExecutePreprocessor.kernel_name=python3 \
        --output "$EXECUTED_NOTEBOOK_FILE"
}

echo "Checking for existing model files..."

if [ "$FORCE_TRAIN" = "true" ]; then
    echo "FORCE_TRAIN is set to true. Starting training..."
    run_training_notebook
elif [ -f "$MODEL_FILE" ] && [ -f "$METADATA_FILE" ]; then
    echo "Model files already exist at $MODEL_FILE and $METADATA_FILE."
    echo "Skipping training. Set FORCE_TRAIN=true to override."
    exit 0
else
    echo "Model files missing. Starting training..."
    run_training_notebook
fi
