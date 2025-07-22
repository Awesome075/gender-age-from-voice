# Voice based Gender and Age Prediction

This project is a mobile application that predicts a person's gender and age range based on their voice. It consists of a Flutter application for the frontend and a Python-based backend with machine learning models.

This project was developed as part of the curriculum for the Flutter subject during the fifth semester. It demonstrates the integration of a Flutter mobile frontend with a Python machine learning backend.

## Project Structure

The project is organized into two main parts:

-   `frontend/`: Contains the Flutter application code, which provides the user interface for recording or uploading an audio file.
-   `backend/`: Contains the Python Flask server, which handles the audio processing and prediction using pre-trained machine learning models.

## Features

-   **Cross-Platform:** Built with Flutter, allowing it to run on both Android and iOS.
-   **Voice Analysis:** Analyzes voice recordings to predict gender and age.
-   **Simple UI:** Easy-to-use interface for selecting and uploading audio files.
-   **Machine Learning Backend:** Utilizes scikit-learn models for prediction.

## Getting Started

To run this project, you need to set up both the backend server and the frontend application.

### Prerequisites

-   Flutter SDK
-   Python 3.x
-   Pip

### Backend Setup

1.  Navigate to the `backend` directory:
    ```bash
    cd backend
    ```
2.  It is recommended to create and activate a virtual environment:
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```
3.  Install the required Python packages using the provided `requirements.txt` file:
    ```bash
    pip install -r requirements.txt
    ```
4.  Start the Flask server:
    ```bash
    python server.py
    ```
    The server will start on `http://0.0.0.0:5000`.

### Frontend Setup

1.  Navigate to the `frontend` directory:
    ```bash
    cd frontend
    ```
2.  Install the Flutter dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the application on your connected device or emulator:
    ```bash
    flutter run
    ```

## How It Works

1.  The user opens the Flutter app and selects a `.wav` or `.mp3` audio file.
2.  The app sends the audio file to the `/predict` endpoint of the backend Flask server.
3.  The Flask server saves the audio file temporarily.
4.  It uses the `librosa` library to extract Mel-frequency cepstral coefficients (MFCCs) from the audio.
5.  The extracted features are fed into two pre-trained scikit-learn models (`gender_model.pkl` and `age_model.pkl`) to predict the gender and age category.
6.  The predictions are returned to the Flutter app as a JSON response.
7.  The app parses the response and displays the predicted gender and age to the user.

## Machine Learning Model Training

The machine learning models used in this project were trained in the `F_Project.ipynb` Jupyter Notebook. The notebook covers the following steps:

-   **Data Loading and Preprocessing:** Loading the dataset and cleaning it for training.
-   **Feature Extraction:** Using `librosa` to extract MFCCs from the audio files.
-   **Model Training:** Training `RandomForestClassifier` models for both age and gender prediction.
-   **Model Evaluation:** Evaluating the models using accuracy scores and cross-validation.
-   **Model Saving:** Saving the trained models to `.pkl` files using `pickle`.

**Note on the Dataset:** The `F_Project.ipynb` notebook uses the Mozilla Common Voice dataset (`cv-corpus-19.0-delta-2024-09-13-en`). This dataset is not included in the repository due to its size. To run the notebook, you will need to download the dataset separately and update the file paths in the notebook accordingly.

## Technologies Used

-   **Frontend:** Flutter, Dart
-   **Backend:** Python, Flask
-   **Machine Learning:** Scikit-learn, Librosa, Numpy, Pandas, Jupyter Notebook
