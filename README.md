# SBCare - SmileBirth

SBCare - SmileBirth is a Flutter app that brings maternal wellness resources and services together in one place. It helps users discover care providers and appointments, use pregnancy-related tools, and access educational content and services.

## What the app includes

- Provider discovery and appointment scheduling
- Pregnancy tools, including a BMI calculator and contraction timer
- E-learning, classes, events, and e-books
- User profiles, schedules, purchases, and voucher features
- Indonesian and English language support

Features that require an account or online services depend on the configured SBCare backend.

## Requirements

- Flutter on the stable channel, with Dart 3 or later
- Android Studio and the Android SDK to run on Android
- A connected Android device or emulator (Android 7.0 / API 24 or later)
- For iOS: macOS, Xcode, and an iOS device or simulator (iOS 15 or later)

The Dart SDK constraint is `>=3.0.0 <4.0.0`. Flutter includes the Dart SDK.

## Set up and run

1. Clone the repository and open its directory:

   ```sh
   git clone <repository-url>
   cd s_b_care_smile_birth
   ```

2. Check that Flutter and the required platform tools are installed:

   ```sh
   flutter doctor -v
   ```

3. Fetch the Dart and Flutter dependencies:

   ```sh
   flutter pub get
   ```

4. List available devices and start the app:

   ```sh
   flutter devices
   flutter run
   ```

To select a particular device, use `flutter run -d <device-id>`. To run the web version in Chrome, use:

```sh
flutter run -d chrome
```

## Build and install

Build a debug APK for Android:

```sh
flutter build apk --debug
```

The APK is written to `build/app/outputs/flutter-apk/app-debug.apk`. Install it on a connected Android device with:

```sh
flutter install
```

For a release APK, configure the Android release signing credentials before building:

```sh
flutter build apk --release
```

Build the web app with `flutter build web`; the deployable files are generated in `build/web`.

To run or build for iOS, use a Mac with Xcode configured, then select an iOS device or simulator in `flutter devices`. iOS distribution builds also require the appropriate Apple signing setup.

## Backend and app services

The app initializes its Supabase backend and uses OneSignal for push notifications and Branch for deep links. These integrations require valid project and platform configuration. When setting up a separate development or production environment, use the service settings and credentials provided by the SBCare project maintainers; do not commit private credentials to source control.

## Project structure

- `lib/` - Flutter application, screens, routing, state, and backend integrations
- `assets/` - App images, fonts, audio, documents, and environment configuration
- `android/`, `ios/`, and `web/` - Platform-specific project files

## Useful commands

```sh
flutter analyze
flutter test
```
