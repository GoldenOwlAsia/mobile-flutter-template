# Sentry Setup Guide

## Overview

This project uses Sentry for error tracking and performance monitoring across all HTTP requests and application errors.

## Configuration

### 1. Get Your Sentry DSN

1. Go to [sentry.io](https://sentry.io)
2. Create a new project or select an existing one
3. Copy your DSN from Project Settings → Client Keys (DSN)

### 2. Add DSN to Environment Files

Add your Sentry DSN to the environment files:

**`.env.staging`**

```env
SENTRY_DSN=https://your-staging-dsn@sentry.io/project-id
```

**`.env.production`**

```env
SENTRY_DSN=https://your-production-dsn@sentry.io/project-id
```

### 3. Environment Variables Available

- `SENTRY_DSN` - Your Sentry project DSN
- `BASE_API_URL` - Your API base URL

## Features Enabled

### ✅ Automatic Error Tracking

- All HTTP errors (network failures, timeouts, server errors)
- Uncaught Dart exceptions
- Flutter framework errors
- Both captured via Firebase Crashlytics AND Sentry

### ✅ Rich Context

HTTP errors include:

- Request URL and method
- HTTP status code
- Response body
- Full stack traces

### ✅ Performance Monitoring

- Automatic performance tracing enabled
- Session tracking
- Breadcrumbs for debugging user actions

### ✅ Environment-specific Configuration

- **Staging**: `environment: 'staging'`
- **Production**: `environment: 'production'`

## Usage

### Accessing Environment Config

```dart
import 'package:myapp/src/config/env_config.dart';

// Get Sentry DSN
String dsn = EnvConfig.sentryDsn;

// Check if Sentry is enabled
if (EnvConfig.isSentryEnabled) {
  // Sentry is configured
}
```

### Manual Error Reporting

```dart
import 'package:sentry_flutter/sentry_flutter.dart';

// Capture an exception
try {
  // Your code
} catch (e, stackTrace) {
  await Sentry.captureException(e, stackTrace: stackTrace);
}

// Add custom context
Sentry.configureScope((scope) {
  scope.setUser(SentryUser(id: userId, email: userEmail));
  scope.setTag('feature', 'authentication');
});
```

## How It Works

1. **App Initialization** (`main.dart`, `main_staging.dart`)
   - Loads environment variables via `flutter_dotenv`
   - Initializes Sentry with DSN from `.env` file
   - Wraps app with Sentry error handling

2. **HTTP Client** (`lib/src/network/data/common/http.dart`)
   - Automatically captures all `DioException` errors
   - Logs unexpected errors
   - Includes request context (URL, method, response)

3. **Environment Config** (`lib/src/config/env_config.dart`)
   - Centralized access to environment variables
   - Helper methods for configuration

## Testing

To test Sentry integration:

```dart
// Trigger a test error
await Sentry.captureMessage('Test message from Flutter');

// Trigger an exception
throw Exception('Test exception for Sentry');
```

## Notes

⚠️ **Important**: Never commit actual DSN values to version control

- DSN values should only be in `.env.staging` and `.env.production`
- These files are in `.gitignore`
- Use `.env.example` as a template

## Environment Setup

Run the appropriate command based on your environment:

```bash
# Staging
flutter run --dart-define=FLAVOR=staging

# Production  
flutter run --dart-define=FLAVOR=production
```

The app will automatically load the corresponding `.env` file and initialize Sentry.
