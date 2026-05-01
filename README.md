# CeliGuard ML - Celiac Disease Malignancy Risk Stratifier

🏥 A machine learning application that predicts malignancy risk in Celiac Disease patients.

## ⚠️ Disclaimer
This is a proof-of-concept using synthetic data. NOT intended for clinical decision-making.

## 🚀 Features
- Random Forest ML model trained on synthetic patient data
- FastAPI REST API backend
- Interactive Streamlit web interface
- Color-coded risk predictions (Low/Moderate/High)
- Clinical explanations for predictions
- Fully Dockerized architecture

## 🏗️ Architecture

The application is organized into three main components:

```
celiguard-ml/
├── backend/          # FastAPI REST API
├── frontend/         # Streamlit web interface
├── train/            # Model training scripts
├── models/           # Shared model files
└── docker-compose.yml
```

### Components

- **Backend (FastAPI)**: REST API that serves predictions using the trained model
- **Frontend (Streamlit)**: Interactive web interface for patient data input
- **Training**: Script to generate synthetic data and train the ML model
- **Models**: Shared directory containing trained model files

## 📊 Input Features

13 clinical features including:
- Demographics (age, sex, BMI)
- Clinical markers (Marsh grade, RCD type)
- Lifestyle factors (diet adherence, smoking)
- Follow-up data (mucosal healing status)

## 🐳 Docker Deployment

### Prerequisites
- Docker
- Docker Compose

### Quick Start

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/celiguard-ml.git
cd celiguard-ml
```
docker-compose up train

# Run backend only
docker-compose up backend

# Run frontend only
docker-compose up frontend
```

### Stop Services

```bash
docker-compose down
```

## 🛠️ Local Development (Without Docker)

### Prerequisites
- Python 3.11+
- pip

### Backend Setup

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn app:app --reload
```

### Frontend Setup

```bash
cd frontend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
streamlit run app.py
```

### Training the Model

```bash
cd train
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
jupyter nbconvert --to notebook --execute model_training_pipeline.ipynb --output model_training_pipeline.executed.ipynb
```

## 📁 Project Structure

```
celiguard-ml/
│
├── backend/
│   ├── app.py                 # FastAPI application
│   ├── requirements.txt       # Backend dependencies
│   ├── Dockerfile            # Backend container config
│   └── .dockerignore
│
├── frontend/
│   ├── app.py                 # Streamlit application
│   ├── requirements.txt       # Frontend dependencies
│   ├── Dockerfile            # Frontend container config
│   └── .dockerignore
│
├── train/
│   ├── train_model.py        # Model training script
│   ├── requirements.txt       # Training dependencies
│   ├── Dockerfile            # Training container config
│   └── .dockerignore
│
├── models/
│   ├── celiac_risk_model.pkl      # Trained model (generated)
│   ├── model_metadata.pkl         # Model metadata (generated)
│   └── README.md
│
├── docker-compose.yml         # Docker orchestration
├── .gitignore
└── README.md
```

## 🔧 Configuration

### Environment Variables

**Backend:**
- `MODEL_PATH`: Path to the trained model file (default: `../models/celiac_risk_model.pkl`)
- `METADATA_PATH`: Path to model metadata (default: `../models/model_metadata.pkl`)

**Frontend:**
- `API_URL`: Backend API URL (default: `http://localhost:8000`)

**Training:**
- `MODEL_OUTPUT_DIR`: Directory to save trained models (default: `../models`)

## 🧪 API Endpoints

### Health Check
```bash
GET /health
```

### Predict Risk
```bash
POST /predict
Content-Type: application/json

{
  "age_at_diagnosis": 45,
  "current_age": 50,
  "years_of_symptoms_before_diagnosis": 5,
  "bmi": 24.5,
  "followup_years": 5,
  "sex": "Female",
  "marsh_grade_at_diagnosis": "3b",
  "mucosal_healing_on_followup": "Yes",
  "rcd_type": "None",
  "smoking_status": "Never",
  "gfd_adherence": "Good",
  "family_history_of_malignancy": "No",
  "hla_risk": "Medium"
}
```

### Model Info
```bash
GET /model-info
```

## 🧬 Model Details

- **Algorithm**: Random Forest Classifier
- **Training Data**: 1,500 synthetic patient records
- **Features**: 13 clinical and demographic features
- **Output Classes**: Low Risk, Moderate Risk, High Risk
- **Preprocessing**: StandardScaler for numeric features, OneHotEncoder for categorical features

## 🔍 Development Notes

### Adding New Features

1. Update `train/model_training_pipeline.ipynb` to include new features in data generation
2. Update `backend/app.py` to accept new features in `PatientInput` model
3. Update `frontend/app.py` to add new input fields
4. Retrain the model

### Rebuilding Docker Images

```bash
# Rebuild all services
docker-compose build

# Rebuild specific service
docker-compose build backend
```

## 👥 Research Team

- Aditya Tiwari
- Ayush Yadav
- Harshit Somvanshi
- Hritik Tiwari

## 📄 License

This project is for educational and research purposes.

## 🤝 Contributing

This is a research project. For questions or suggestions, please contact the research team.

## 📚 References

This project uses synthetic data based on general medical knowledge about Celiac Disease and associated malignancy risk factors. It is NOT validated for clinical use.
