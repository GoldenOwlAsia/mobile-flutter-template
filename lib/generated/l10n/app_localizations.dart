import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @common_appTitle.
  ///
  /// In en, this message translates to:
  /// **'My App'**
  String get common_appTitle;

  /// Version number of app
  ///
  /// In en, this message translates to:
  /// **'Version {value}'**
  String common_appVersion(String value);

  /// No description provided for @common_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get common_loading;

  /// No description provided for @common_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get common_next;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get common_no;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get common_close;

  /// No description provided for @common_exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get common_exit;

  /// No description provided for @common_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get common_back;

  /// No description provided for @common_tap_to_refresh.
  ///
  /// In en, this message translates to:
  /// **'Tap to refresh'**
  String get common_tap_to_refresh;

  /// No description provided for @common_list_empty_title.
  ///
  /// In en, this message translates to:
  /// **'List empty!'**
  String get common_list_empty_title;

  /// No description provided for @common_gallery_request_title.
  ///
  /// In en, this message translates to:
  /// **'Gallery Permission was denied'**
  String get common_gallery_request_title;

  /// No description provided for @common_gallery_request_content.
  ///
  /// In en, this message translates to:
  /// **'We need your gallery to upload your profile avatar or create photo message, Do you want to grant permission?'**
  String get common_gallery_request_content;

  /// No description provided for @common_camera_request_title.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission was denied'**
  String get common_camera_request_title;

  /// No description provided for @common_camera_request_content.
  ///
  /// In en, this message translates to:
  /// **'We need your camera to upload your profile avatar or create photo message, Do you want to grant permission?'**
  String get common_camera_request_content;

  /// No description provided for @camera_choose_option_take_image.
  ///
  /// In en, this message translates to:
  /// **'Please choose option to take image'**
  String get camera_choose_option_take_image;

  /// No description provided for @camera_choose_option_take_video.
  ///
  /// In en, this message translates to:
  /// **'Please choose option to take video'**
  String get camera_choose_option_take_video;

  /// No description provided for @camera_image_from_camera.
  ///
  /// In en, this message translates to:
  /// **'Image from camera'**
  String get camera_image_from_camera;

  /// No description provided for @camera_video_from_camera.
  ///
  /// In en, this message translates to:
  /// **'Video from camera'**
  String get camera_video_from_camera;

  /// No description provided for @camera_image_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Image from gallery'**
  String get camera_image_from_gallery;

  /// No description provided for @camera_video_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Video from gallery'**
  String get camera_video_from_gallery;

  /// No description provided for @error_noInternet.
  ///
  /// In en, this message translates to:
  /// **'A Server Error Occurred'**
  String get error_noInternet;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'An Unknown Error Occurred'**
  String get error_unknown;

  /// No description provided for @error_somethingWrongTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, try again...'**
  String get error_somethingWrongTryAgain;

  /// No description provided for @error_fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get error_fieldRequired;

  /// No description provided for @error_not_login_yet.
  ///
  /// In en, this message translates to:
  /// **'Not Login yet!'**
  String get error_not_login_yet;

  /// No description provided for @error_upload_file_fail.
  ///
  /// In en, this message translates to:
  /// **'Upload failed. Please check the file and try again.'**
  String get error_upload_file_fail;

  /// No description provided for @sign_signin_signinWithApple.
  ///
  /// In en, this message translates to:
  /// **'Login with Apple'**
  String get sign_signin_signinWithApple;

  /// No description provided for @sign_signin_signinWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get sign_signin_signinWithGoogle;

  /// No description provided for @sign_signin_signinWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Login with Facebook'**
  String get sign_signin_signinWithFacebook;

  /// No description provided for @chat_room_this_is_reply.
  ///
  /// In en, this message translates to:
  /// **'reply message 🖼️'**
  String get chat_room_this_is_reply;

  /// No description provided for @chat_room_this_is_photo.
  ///
  /// In en, this message translates to:
  /// **'send an photo message 🖼️'**
  String get chat_room_this_is_photo;

  /// No description provided for @chat_room_this_is_video.
  ///
  /// In en, this message translates to:
  /// **'send an video message 📹'**
  String get chat_room_this_is_video;

  /// No description provided for @chat_room_this_is_audio.
  ///
  /// In en, this message translates to:
  /// **'send an audio message 🎤'**
  String get chat_room_this_is_audio;

  /// No description provided for @chat_room_this_is_file.
  ///
  /// In en, this message translates to:
  /// **'send an file message 📁'**
  String get chat_room_this_is_file;

  /// No description provided for @chat_room_you.
  ///
  /// In en, this message translates to:
  /// **'You: {value}'**
  String chat_room_you(Object value);

  /// No description provided for @chat_room_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get chat_room_all;

  /// No description provided for @chat_room_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get chat_room_online;

  /// No description provided for @chat_room_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get chat_room_favorites;

  /// No description provided for @chat_reply_content_of_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo message 🖼️'**
  String get chat_reply_content_of_photo;

  /// No description provided for @chat_reply_content_of_video.
  ///
  /// In en, this message translates to:
  /// **'Video message 📹'**
  String get chat_reply_content_of_video;

  /// No description provided for @chat_reply_content_of_audio.
  ///
  /// In en, this message translates to:
  /// **'Audio message 🎤'**
  String get chat_reply_content_of_audio;

  /// No description provided for @chat_reply_content_of_file.
  ///
  /// In en, this message translates to:
  /// **'File message 📁'**
  String get chat_reply_content_of_file;

  /// No description provided for @chat_reply_to.
  ///
  /// In en, this message translates to:
  /// **'Reply to {value}'**
  String chat_reply_to(Object value);

  /// No description provided for @chat_replied_to.
  ///
  /// In en, this message translates to:
  /// **'Replied to {value}'**
  String chat_replied_to(Object value);

  /// No description provided for @chat_replied_yourself.
  ///
  /// In en, this message translates to:
  /// **'yourself'**
  String get chat_replied_yourself;

  /// No description provided for @sign_login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get sign_login_title;

  /// No description provided for @sign_login_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_login_email;

  /// No description provided for @sign_login_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_login_password;

  /// No description provided for @sign_login_forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get sign_login_forgotPassword;

  /// No description provided for @sign_login_noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get sign_login_noAccount;

  /// No description provided for @sign_login_signupNow.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get sign_login_signupNow;

  /// No description provided for @sign_login_error.
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get sign_login_error;

  /// No description provided for @sign_signup_title.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_signup_title;

  /// No description provided for @sign_signup_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get sign_signup_username;

  /// No description provided for @sign_signup_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_signup_email;

  /// No description provided for @sign_signup_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_signup_password;

  /// No description provided for @sign_signup_success.
  ///
  /// In en, this message translates to:
  /// **'Signup success'**
  String get sign_signup_success;

  /// No description provided for @sign_signup_error.
  ///
  /// In en, this message translates to:
  /// **'Signup fail'**
  String get sign_signup_error;

  /// No description provided for @sign_forgot_title.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get sign_forgot_title;

  /// No description provided for @sign_forgot_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_forgot_email;

  /// No description provided for @sign_forgot_success.
  ///
  /// In en, this message translates to:
  /// **'Your request was successful! Please check your email to reset your password.'**
  String get sign_forgot_success;

  /// No description provided for @account_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get account_logout;

  /// No description provided for @account_logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you would like to logout?'**
  String get account_logout_confirm;

  /// No description provided for @account_removeAccount.
  ///
  /// In en, this message translates to:
  /// **'Remove Account'**
  String get account_removeAccount;

  /// No description provided for @account_removeAccount_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you would like to remove account? Your profile will be cleared'**
  String get account_removeAccount_confirm;

  /// No description provided for @account_profile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get account_profile;

  /// No description provided for @account_changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get account_changePassword;

  /// No description provided for @account_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get account_address;

  /// No description provided for @common_pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get common_pageNotFound;

  /// No description provided for @last_line.
  ///
  /// In en, this message translates to:
  /// **''**
  String get last_line;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
