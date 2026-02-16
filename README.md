# CW1 Counter & Image Toggle App

A Flutter application demonstrating state management, animations, and interactive UI components.

## Features

### Core Features
- **Counter System**: Increment/decrement counter with dynamic color changes
- **Image Toggle**: Smooth animated transitions between two images
- **Theme Switching**: Toggle between light and dark modes
- **Sound Effects**: Audio feedback when toggling images

### Scale-Up Features
- **Multi-Step Controls**: Choose between +1, +5, and +10 increment steps
- **Decrement & Reset**: Full counter control with disabled states at zero
- **History & Undo**: Tracks last 5 actions with one-tap undo functionality

### Bonus Features
- **Dynamic Counter Colors**: Counter changes from green to orange to red as value increases
- **Sound Effect**: Toggle sound plays when switching images

## Project Structure

```
cw1_counter_app/
├── lib/
│   └── main.dart
├── assets/
│   ├── image1.png
│   ├── image2.png
│   └── toggle_sound.mp3
├── android/
└── pubspec.yaml
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code with Flutter extensions
- Android SDK

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Ahenriquez28/cw1_counter_app.git
cd cw1_counter_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building APK

To build a release APK:
```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

## How to Use

1. **Counter Controls**:
   - Press "Increment" to increase the counter
   - Press "Decrement" to decrease the counter
   - Press "Reset" to return counter to zero
   - Press "Undo" to revert the last action

2. **Step Selection**:
   - Choose between +1, +5, or +10 step sizes
   - All counter operations use the selected step

3. **Image Toggle**:
   - Press "Toggle Image" to switch between sun and moon images
   - Enjoy the smooth fade animation and sound effect

4. **Theme Toggle**:
   - Press the theme icon in the app bar to switch between light and dark modes

## Course Information

- **Course**: CSC 4360 - Mobile App Development
- **Assignment**: CW #01 - Counter & Image Toggle App
- **Due Date**: 02/15/2026

## Technical Details

- **Framework**: Flutter
- **Language**: Dart
- **Dependencies**: audioplayers (for sound effects)
- **Animations**: FadeTransition with CurvedAnimation
- **State Management**: setState()

## Authors

Student names and IDs to be added

## License

This project is created for educational purposes as part of CSC 4360 coursework.
