# Build Instructions for CW1 Counter App

## Prerequisites
- Flutter SDK installed and configured
- Android SDK installed
- Git installed

## Step 1: Clone or Setup Project

If you haven't already pushed to GitHub:
```bash
cd cw1_counter_app
bash setup_git.sh
```

To clone from GitHub:
```bash
git clone https://github.com/Ahenriquez28/cw1_counter_app.git
cd cw1_counter_app
```

## Step 2: Install Dependencies

```bash
flutter pub get
```

## Step 3: Verify Flutter Installation

```bash
flutter doctor
```

Make sure Android toolchain shows no errors.

## Step 4: Build APK

For release APK:
```bash
flutter build apk --release
```

For split APKs (smaller file sizes):
```bash
flutter build apk --release --split-per-abi
```

## Step 5: Locate APK

The APK will be at:
- Standard APK: `build/app/outputs/flutter-apk/app-release.apk`
- Split APKs: `build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk` (and other architectures)

## Step 6: Test on Device

To install on connected Android device:
```bash
flutter install
```

Or manually install the APK:
```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

## Troubleshooting

### Issue: "flutter: command not found"
Solution: Add Flutter to your PATH or use the full path to flutter executable

### Issue: Android licenses not accepted
Solution: Run `flutter doctor --android-licenses` and accept all

### Issue: Gradle build fails
Solution: Make sure you have Java JDK 11 or higher installed

### Issue: Assets not found
Solution: Run `flutter clean` then `flutter pub get` then rebuild

## Common Commands

Run in debug mode:
```bash
flutter run
```

Run in release mode:
```bash
flutter run --release
```

Clean build files:
```bash
flutter clean
```

Get dependencies:
```bash
flutter pub get
```

## Submission Checklist

- [ ] APK built successfully
- [ ] Code pushed to GitHub
- [ ] SUBMISSION.txt updated with student names
- [ ] APK tested on device or emulator
- [ ] All features working (counter, images, theme, sound)
- [ ] README.md reviewed

## Support

For Flutter documentation: https://docs.flutter.dev
For course support: Contact your instructor or TA
