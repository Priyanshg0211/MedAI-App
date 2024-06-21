# MedAI: Medical Report Analysis App

MedAI is a Flutter application that enables users to upload and analyze their medical reports using AI. The app utilizes Firebase Authentication for secure user login and registration.

## Features

- User authentication using Firebase Auth
- Upload medical reports for AI analysis
- Receive detailed analysis of uploaded reports
- User-friendly and intuitive UI

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase account: [Create a Firebase account](https://firebase.google.com/)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/medai.git
    cd medai
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Set up Firebase:**

    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project.
    - Add an Android app and/or iOS app to your Firebase project.
    - Follow the instructions to download the `google-services.json` file for Android.
    - Place the `google-services.json` file in the `android/app` directory.
    - Enable Google sign-in method in the Firebase Authentication section.

4. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

1. **Login:**
   - Open the app and login with google or an existing account using Firebase Authentication.

2. **Upload Medical Report:**
   - After logging in, navigate to the upload section.
   - Upload a medical report for AI analysis.

3. **View Analysis:**
   - Once the report is analyzed, view the detailed results on the analysis screen.

## Firebase Setup

Ensure you follow these steps to set up Firebase properly:

### Android

1. Open `android/build.gradle` and add the following classpath:

    ```groovy
    classpath 'com.google.gms:google-services:4.3.3'
    ```

2. Open `android/app/build.gradle` and add the following line at the bottom:

    ```groovy
    apply plugin: 'com.google.gms.google-services'
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)
- AI model for medical report analysis (details based on the specific AI service used)

## Contact

For any questions or feedback, please contact us at priyansh.gupta200311@gmail.com.

---
