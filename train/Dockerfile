FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy training notebook and entrypoint
COPY model_training_pipeline.ipynb .
COPY entrypoint.sh .
RUN sed -i 's/\r$//' entrypoint.sh && chmod +x entrypoint.sh

# Run the entrypoint script
CMD ["bash", "./entrypoint.sh"]
