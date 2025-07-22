from flask import Flask, request, jsonify
from flask_cors import CORS  # Enable CORS
import librosa
import numpy as np
import pickle

app = Flask(__name__)
CORS(app)  # Add CORS support for cross-origin requests

import os

# Get the absolute path of the directory where the script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Load pre-trained models using relative paths
with open(os.path.join(script_dir, 'gender_model.pkl'), 'rb') as f:
    gender_model = pickle.load(f)

with open(os.path.join(script_dir, 'age_model.pkl'), 'rb') as f:
    age_model = pickle.load(f)


def extract_features(audio_path):
    y, sr = librosa.load(audio_path, sr=16000)  # Load audio file
    mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)  # Extract MFCC features
    return np.mean(mfcc, axis=1).reshape(1, -1)  # Return the mean of MFCC features


@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    # Save the uploaded file temporarily
    file_path = 'temp.wav'
    file.save(file_path)

    # Extract features from the audio
    features = extract_features(file_path)

    # Predict gender and age using the loaded models
    gender_prediction = gender_model.predict(features)
    age_prediction = age_model.predict(features)

    # Convert predictions
    gender = 'Female' if gender_prediction[0] == 1 else 'Male'
    age = ['Teens/Twenties', 'Thirties', 'Forties', 'Fifties/Sixties'][age_prediction[0]]
  # Assuming age model outputs a scalar age value
    
    return jsonify({'gender': gender, 'age': age})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
