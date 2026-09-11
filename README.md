# EasyCharge (E47nly)

## Faculty of Science - Physics and Computer Science Department - Zagazig University
### First Term Graduation Project

**Download The App:**
[E47nly APK](https://www.mediafire.com/file/x44f0swus86cu4u/E47nly.apk/file)

---

## 📱 About the App
EasyCharge is a smart, Flutter-based mobile application designed to simplify the process of recharging telecom network cards in Egypt. By utilizing Google's ML Kit for on-device Text Recognition (OCR), the app can scan physical scratch cards and automatically extract the recharge code, eliminating the need for manual entry.

The app natively supports all four major Egyptian telecom providers:
*   **Vodafone**
*   **Orange**
*   **We**
*   **Etisalat**

## ✨ Features
*   **Smart Scanning (OCR)**: Instantly extracts recharge codes from physical cards using the device camera.
*   **Multiple Charging Options**: Supports standard recharge and custom provider packages (e.g., Mared Minutes, Ahsan Nas, etc.).
*   **Bilingual Support**: Fully localized in both English and Arabic with seamless Right-to-Left (RTL) layout switching.
*   **Card History**: Keeps a local database log of your previously scanned and charged cards.
*   **Modern UI**: Beautiful, intuitive interface built with Material 3 and Hero animations.

---

## 🛠️ Development Environment Setup

To run and contribute to this project, you need to set up your Flutter development environment.

### Prerequisites
1.  **Flutter SDK**: Ensure you have Flutter installed (version 3.19.0 or higher recommended). [Install Flutter](https://docs.flutter.dev/get-started/install)
2.  **Java SDK**: Java 17 is required for the Android Gradle Plugin (AGP 8.11+).
3.  **Android Studio** or **VS Code**: With the Flutter and Dart plugins installed.
4.  **Android SDK**: Accessible via Android Studio (API 34+ recommended).

### Installation Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/alhassanmohamed2/easycharge.git
    cd easycharge/easycharge
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    Connect a physical device or start an emulator, then run:
    ```bash
    flutter run
    ```

4.  **Build a Production APK:**
    To generate a release APK for Android:
    ```bash
    flutter build apk --release
    ```
    *The generated APK will be located at `easycharge/build/app/outputs/flutter-apk/app-release.apk`.*

---

## 📖 How to Use the App

1.  **Choose Your Language:** Upon launching the app, you can open the side drawer menu (top right/left corner) to easily switch between English and Arabic.
2.  **Select Your Carrier:** On the Home Screen, tap on the logo of your network carrier (Vodafone, Orange, We, or Etisalat).
3.  **Choose a Package:** Select the specific type of recharge package you want to apply (e.g., Normal Recharge, Internet, Mixes).
4.  **Scan the Card:** 
    *   Tap the camera icon to open the OCR scanner.
    *   Point your camera at the revealed numbers on your physical scratch card.
    *   The app will automatically read, extract, and verify the numerical code.
5.  **Confirm & Charge:** Once the code is extracted, the app will execute the corresponding USSD code for your carrier to charge your balance.
6.  **View History:** You can navigate to the "Charged Cards" screen from the side menu to view a history of all the cards you have scanned and processed.
