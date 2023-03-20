# Flutter Boilerplate

<p align="center">
  <a href="https://flutter.io/">
    <img src="https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg" alt="Logo" width=320 height=72>
  </a>

  <!-- <h3 align="center">Flutter Boilerplate Project</h3> -->

  <p align="center">
    Fork this project then start you project with a lot of stuck prepare
    <br>
    Base project made with much  :heart: . Contains Bloc, Route, and much more!
    <br>
    <br>
    <a href="https://github.com/GoldenOwlAsia/mobile-flutter-template/issues/new">Report bug</a>
    ·
    <a href="https://github.com/GoldenOwlAsia/mobile-flutter-template/issues/new">Request feature</a>
  </p>
</p>

## Table of contents

- [How to Use](#how-to-use)
- [Code Conventions](#code-conventions)
- [Dependencies](#dependencies)
- [Code structure](#code-structure)

## Prerequisites
- Flutter: >=3.7.0 <7.0.0

## How to Use 

1. Download or clone this repo by using the link below:
  ```
  https://github.com/GoldenOwlAsia/mobile-flutter-template.git
  ```
2. Go to project root and execute the following command in console to get the required dependencies: 

  ```
  flutter pub get 
  ```
3. Now run the generator
  ```
  flutter packages pub run build_runner build
  ```

# Code Conventions
- [analysis_options.yaml](analysis_options.yaml)
- [About code analytics flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

  In Flutter, Modularization will be done at a file level. While building widgets, we have to make sure they stay independent and re-usable as maximum. Ideally, widgets should be easily extractable into an independent project.


# Dependencies

  ![](resources/images/dependencies.jpg) 

## Helper
- [logger](https://pub.dev/packages/logger): Small, easy to use and extensible logger which prints beautiful logs.

- [url_launcher](https://pub.dev/packages/url_launcher): A Flutter plugin for launching a URL in the mobile platform. Supports iOS, Android, web, Windows, macOS, and Linux.

- [auto_route](https://pub.dev/packages/auto_route): Auto route generator, Manager router

- [get_it](https://pub.dev/packages/get_it): This is a simple Service Locator

- [intl](https://pub.dev/packages/intl): This package provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.

- [shared_preferences](https://pub.dev/packages/shared_preferences): Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.

- [package_info_plus](https://pub.dev/packages/package_info_plus): This Flutter plugin provides an API for querying information about an application package.

- [device_info_plus](https://pub.dev/packages/device_info_plus): Get current device information from within the Flutter application.

- [permission_handler](https://pub.dev/packages/permission_handler): Permission plugin for Flutter. This plugin provides a cross-platform (iOS, Android) API to request and check permissions.

## HTTP, API
- [http](https://pub.dev/packages/http): A composable, Future-based library for making HTTP requests.


## Flutter Fire
  > The official Firebase plugins for Flutter. sign_in, analytics, crashlytics, storage, firestore
- [Flutter Fire](https://firebase.flutter.dev/)


## State Management
  > State Management is still the hottest topic in Flutter Community. There are tons of choices available and it’s super intimidating for a beginner to choose one. Also, all of them have their pros and cons. So, what’s the best approach

**A recommended approach**
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Widgets that make it easy to integrate blocs and cubits into Flutter. [Learn more](https://bloclibrary.dev/#/) 

## Flutter Gen
- [flutter_gen](https://pub.dev/packages/flutter_gen): The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.

## Localization 
- [localization](https://pub.dev/packages/localization): Package to simplify in-app translation.

## Widget
- [shimmer](https://pub.dev/packages/shimmer): Shimmer loading animation
- [flutter_html](https://pub.dev/packages/flutter_html)
- [webview_flutter](https://pub.dev/packages/webview_flutter)

## Image
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager)

# Code structure
Here is the core folder structure which flutter provides.
```
flutter-app/
|- android
|- ios
|- web
|- lib
|- modules
|- test
```
Here is the folder structure we have been using in this project

```
lib/
|- packages/
|- src/
  |- data/
  |- services/
  |- feature/
    |- dashboard/
      |- widget/
      |- controller
      |- dashboard_screen.dart
    |- home/
    |- login/
  |- plugins/
  |- routing/
|- widgets/
  |- button/
  |- image/
  |- view/
|- main.dart
|- modules
```

## Navigation Stack
![](resources/images/screens.png) 

## Wiki
Checkout [wiki](https://github.com/GoldenOwlAsia/mobile-flutter-template/wiki) for more info

## Screenshot

| Account | Profile | Login |
|------------|-------------|-------------|
|  <img src="./resources/images/account.png" width=300> |  <img src="./resources/images/profile.png" width=300> | <img src="./resources/images/login.png" width=300> |

