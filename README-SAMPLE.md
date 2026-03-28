# Flutter Project

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Environment Setup](#environment-setup)
- [How to Use](#how-to-use)
- [Project Structure](#project-structure)
- [Code Conventions](#code-conventions)
- [Git Conventions](#git-conventions)
- [Dependencies](#dependencies)
- [Additional Documentation](#additional-documentation)

---

## Prerequisites

- **Flutter:** `>=3.38.3` (see [Flutter installation guide](https://flutter.dev/docs/get-started/install))
- **Android Studio** - [Latest version](https://developer.android.com/studio/install)
- **macOS & Xcode** (required for iOS build & debug)
- **Firebase Projects** (staging and production)
- **CocoaPods** (for iOS dependencies)

---

## Quick Start

Get up and running in minutes:

```sh
# Clone and setup
git clone <your-repository-url>
cd <project-directory>
flutter pub get

# Set up environment (see Environment Setup section below)
# Create .env.staging and .env.production files

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run --flavor staging --target lib/main_staging.dart
```

For detailed instructions, see [How to Use](#how-to-use) section below.

---

## Environment Setup

This project uses environment variables for configuration. You need to create two environment files:

### Required Environment Files

- `.env.staging` - Staging environment configuration
- `.env.production` - Production environment configuration

### Environment Variables

Add the following variables to your `.env` files:

```env
# Sentry Configuration
SENTRY_DSN=https://your-sentry-dsn@sentry.io/project-id

# API Configuration
BASE_API_URL=https://your-api-url.com
```

> ⚠️ **Important:** Never commit actual `.env.staging` or `.env.production` files to version control. These files are in `.gitignore`.

For detailed Sentry setup, see [SENTRY_SETUP.md](SENTRY_SETUP.md).

---

## How to Use

### Step 1: Clone Repository

```sh
git clone <your-repository-url>
cd <project-directory>
```

### Step 2: Install Flutter

If you haven't already, install Flutter by following the [official installation guide](https://flutter.dev/docs/get-started/install).

Verify your installation:

```sh
flutter doctor
```

Make sure all required components are installed and configured correctly.

### Step 3: Install Dependencies

Navigate to the project root directory and install all required dependencies:

```sh
flutter pub get
```

This will download all packages listed in `pubspec.yaml`.

### Step 4: Set Up Environment Variables

This project uses environment variables for configuration. You need to create two files:

1. Create `.env.staging` file with staging configuration
2. Create `.env.production` file with production configuration

See the [Environment Setup](#environment-setup) section above for required variables and details.

> ⚠️ **Important:** These files are in `.gitignore` and should never be committed to version control.

### Step 5: Generate Code

This project uses code generation for several packages (`freezed`, `json_serializable`, etc.). Generate the required files:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

> **Note:** Re-run this command whenever you:
>
> - Modify models with `@freezed` or `@JsonSerializable` annotations
> - Add or update form validators
> - Make changes that require code generation

For watch mode (auto-regenerate on file changes):

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Step 6: Run the App

Connect your physical device or start an emulator/simulator, then run:

**Staging Environment:**

```sh
flutter run --flavor staging --target lib/main_staging.dart
```

**Production Environment:**

```sh
flutter run --flavor production --target lib/main.dart
```

**Tips:**

- Use `-d <device-id>` to specify a device if multiple are connected
- Use `--release` flag for release mode builds
- Use `--profile` flag for profiling builds

### Step 7: Build for Release

#### Android

1. **Update version and build number** in `pubspec.yaml`:

   ```yaml
   version: 1.2.0+2 # version+buildNumber
   ```

2. **Build app bundle:**

   **Staging:**

   ```sh
   flutter build appbundle --flavor staging --target lib/main_staging.dart --build-name=1.2.0 --build-number=2
   ```

   **Production:**

   ```sh
   flutter build appbundle --flavor production --build-name=1.2.0 --build-number=2
   ```

   Or use Makefile:

   ```sh
   make buildAndroidStag   # Staging
   make buildAndroidProd    # Production
   ```

3. **Upload to Play Console:**
   - Access [Google Play Console](https://play.google.com/console/u/0/developers)
   - Create a new release and upload your `.aab` file
   - For detailed deployment instructions, see [DEPLOY.md](DEPLOY.md)

#### iOS

1. **Update version and build number** in Xcode:
   - Open `ios/Runner.xcodeproj` in Xcode
   - Update version in project settings

2. **Install CocoaPods dependencies:**

   ```sh
   cd ios && pod install && cd ..
   ```

3. **Build options:**

   **Manually:**

   ```sh
   flutter build ios --release --no-codesign --flavor staging --target lib/main_staging.dart
   ```

   - Open Xcode and deploy
   - Select **Product** > **Archive** to build and deploy to TestFlight

   **Using Fastlane:**

   ```sh
   cd ios
   fastlane beta
   ```

   For detailed deployment instructions, see [DEPLOY.md](DEPLOY.md)

### Preview Widgets

Preview widgets using the widget preview tool:

```sh
flutter widget-preview start
```

### Testing

Run tests:

```sh
# Run all tests
flutter test

# Run specific test file
flutter test test/unit_test.dart
```

---

## Project Structure

```text
lib/
├── generated/          # Generated files (localization, assets)
│   └── l10n/          # Localization files
├── firebase_options/   # Firebase configuration files
├── packages/          # Shared packages
├── preview/           # Widget preview helpers
├── src/               # Main application code
│   ├── config/        # App configuration
│   ├── data/          # Data layer (repositories, models)
│   ├── features/      # Feature modules
│   │   ├── account/
│   │   ├── authentication/
│   │   └── ...
│   ├── network/       # Network layer
│   ├── router/        # Navigation/routing
│   ├── services/      # Services (Firebase, Sentry, etc.)
│   └── ...
├── widgets/           # Reusable widgets (XButton, XText, etc.)
├── main.dart          # Production entry point
└── main_staging.dart  # Staging entry point
```

### Feature Structure

Each feature follows this structure:

```text
feature_name/
├── logic/          # BLoC/Cubit (state management)
├── model/          # Models and form validators
├── view/           # Screen widgets
└── widget/         # Feature-specific widgets
```

---

## Code Conventions

- [analysis_options.yaml](analysis_options.yaml) - Linting and analysis rules
- [Effective Code in Flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

### Best Practices

- **Modularization:** Modularize widgets to be as independent and reusable as possible. Widgets should be easily extractable into an independent project.

### Naming Conventions

- **Models:** Start with `M` → `MUser`, `MProduct`, `MGroup`
- **Common Widgets:** Start with `X` → `XButton`, `XText`, `XAppBar` (stored in `lib/widgets/`)
- **App Constants/Services:** Start with `App` → `AppStyles`, `AppColor`, `AppRouter`, `AppCoordinator`, `UserPrefs`

### Localization

This project uses Flutter's built-in localization system:

- ARB files are located in `lib/generated/l10n/`
- Generate localization files:

  ```sh
  flutter gen-l10n
  ```

  Or use Makefile:

  ```sh
  make genLanguage
  ```

---

## Git Conventions

- [Git Versioning and Code Reviews](https://www.notion.so/jimmy9/Git-Versioning-and-Code-Reviews-dea414c5e38d4db7b36180e395843968)
- [Gitflow workflow](https://jimmy9.notion.site/Gitflow-workflow-414b8914b7e64a4d8198d47e6d9cc2f8?pvs=4)

---

## Dependencies

### State Management

- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - BLoC pattern implementation. Learn more at [bloclibrary.dev](https://bloclibrary.dev/#/)!

### Routing & Navigation

- **[go_router](https://pub.dev/packages/go_router)** - Declarative routing for Flutter

### Dependency Injection

- **[get_it](https://pub.dev/packages/get_it)** - Service locator for dependency injection

### Code Generation & Assets

- **[flutter_gen](https://pub.dev/packages/flutter_gen)** - Strongly typed assets, fonts, colors — Get rid of all String-based APIs
- **[build_runner](https://pub.dev/packages/build_runner)** - Code generation tool
- **[freezed](https://pub.dev/packages/freezed)** - Code generation for unions/pattern-matching/copy
- **[json_serializable](https://pub.dev/packages/json_serializable)** - JSON serialization

### Firebase

- **[firebase_core](https://pub.dev/packages/firebase_core)** - Firebase initialization
- **[firebase_auth](https://pub.dev/packages/firebase_auth)** - Authentication
- **[firebase_analytics](https://pub.dev/packages/firebase_analytics)** - Analytics
- **[firebase_messaging](https://pub.dev/packages/firebase_messaging)** - Push notifications
- **[firebase_remote_config](https://pub.dev/packages/firebase_remote_config)** - Remote configuration
- **[cloud_firestore](https://pub.dev/packages/cloud_firestore)** - Cloud Firestore database
- **[firebase_app_check](https://pub.dev/packages/firebase_app_check)** - App verification

### Error Tracking & Monitoring

- **[sentry_flutter](https://pub.dev/packages/sentry_flutter)** - Error tracking and performance monitoring
- See [SENTRY_SETUP.md](SENTRY_SETUP.md) for setup instructions

### HTTP & Networking

- **[dio](https://pub.dev/packages/dio)** - HTTP client
- **[connectivity_plus](https://pub.dev/packages/connectivity_plus)** - Network connectivity status

### UI & Widgets

- **[flutter_svg](https://pub.dev/packages/flutter_svg)** - SVG rendering
- **[lottie](https://pub.dev/packages/lottie)** - Lottie animations
- **[cached_network_image](https://pub.dev/packages/cached_network_image)** - Cached network images
- **[shimmer](https://pub.dev/packages/shimmer)** - Loading shimmer effect
- **[photo_view](https://pub.dev/packages/photo_view)** - Photo viewer
- **[webview_flutter](https://pub.dev/packages/webview_flutter)** - WebView widget

### Utilities

- **[logger](https://pub.dev/packages/logger)** - Pretty logging
- **[shared_preferences](https://pub.dev/packages/shared_preferences)** - Key-value storage
- **[url_launcher](https://pub.dev/packages/url_launcher)** - Launch URLs
- **[permission_handler](https://pub.dev/packages/permission_handler)** - Permission management
- **[device_info_plus](https://pub.dev/packages/device_info_plus)** - Device information
- **[package_info_plus](https://pub.dev/packages/package_info_plus)** - App package info
- **[formz](https://pub.dev/packages/formz)** - Form validation
- **[intl](https://pub.dev/packages/intl)** - Internationalization and formatting
- **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)** - Environment variable management

For a complete list, see [pubspec.yaml](pubspec.yaml).

---

## Additional Documentation

- **[DEPLOY.md](DEPLOY.md)** - Detailed deployment instructions for Android and iOS
- **[SENTRY_SETUP.md](SENTRY_SETUP.md)** - Sentry error tracking setup guide
- **[SECURITY.md](SECURITY.md)** - Security policy and vulnerability reporting

---

## Links

<!-- Update these links with your actual project links -->

- [Download Android](#) - Add your Android app download link
- [Download iOS](#) - Add your iOS app download link
- [Link Web](#) - Add your web app link
- [Firebase Console](#) - Add your Firebase console link
- [Design Figma](#) - Add your Figma design link
- [Tasks - Trello](#) - Add your Trello board link
- [Source Code - GitLab](#) - Add your GitLab repository link

---

## Screenshots

Add screenshots of your app here.
