// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_appTitle => 'My App';

  @override
  String common_appVersion(String value) {
    return 'Version $value';
  }

  @override
  String get common_loading => 'Loading';

  @override
  String get common_next => 'Next';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_yes => 'Yes';

  @override
  String get common_no => 'No';

  @override
  String get common_close => 'Close';

  @override
  String get common_exit => 'Exit';

  @override
  String get common_back => 'Back';

  @override
  String get common_tap_to_refresh => 'Tap to refresh';

  @override
  String get common_list_empty_title => 'List empty!';

  @override
  String get common_gallery_request_title => 'Gallery Permission was denied';

  @override
  String get common_gallery_request_content =>
      'We need your gallery to upload your profile avatar or create photo message, Do you want to grant permission?';

  @override
  String get common_camera_request_title => 'Camera Permission was denied';

  @override
  String get common_camera_request_content =>
      'We need your camera to upload your profile avatar or create photo message, Do you want to grant permission?';

  @override
  String get camera_choose_option_take_image =>
      'Please choose option to take image';

  @override
  String get camera_choose_option_take_video =>
      'Please choose option to take video';

  @override
  String get camera_image_from_camera => 'Image from camera';

  @override
  String get camera_video_from_camera => 'Video from camera';

  @override
  String get camera_image_from_gallery => 'Image from gallery';

  @override
  String get camera_video_from_gallery => 'Video from gallery';

  @override
  String get error_noInternet => 'A Server Error Occurred';

  @override
  String get error_unknown => 'An Unknown Error Occurred';

  @override
  String get error_somethingWrongTryAgain =>
      'Something went wrong, try again...';

  @override
  String get error_fieldRequired => 'This field is required';

  @override
  String get error_not_login_yet => 'Not Login yet!';

  @override
  String get error_upload_file_fail =>
      'Upload failed. Please check the file and try again.';

  @override
  String get sign_signin_signinWithApple => 'Login with Apple';

  @override
  String get sign_signin_signinWithGoogle => 'Login with Google';

  @override
  String get sign_signin_signinWithFacebook => 'Login with Facebook';

  @override
  String get chat_room_this_is_reply => 'reply message 🖼️';

  @override
  String get chat_room_this_is_photo => 'send an photo message 🖼️';

  @override
  String get chat_room_this_is_video => 'send an video message 📹';

  @override
  String get chat_room_this_is_audio => 'send an audio message 🎤';

  @override
  String get chat_room_this_is_file => 'send an file message 📁';

  @override
  String chat_room_you(Object value) {
    return 'You: $value';
  }

  @override
  String get chat_room_all => 'All';

  @override
  String get chat_room_online => 'Online';

  @override
  String get chat_room_favorites => 'Favorites';

  @override
  String get chat_reply_content_of_photo => 'Photo message 🖼️';

  @override
  String get chat_reply_content_of_video => 'Video message 📹';

  @override
  String get chat_reply_content_of_audio => 'Audio message 🎤';

  @override
  String get chat_reply_content_of_file => 'File message 📁';

  @override
  String chat_reply_to(Object value) {
    return 'Reply to $value';
  }

  @override
  String chat_replied_to(Object value) {
    return 'Replied to $value';
  }

  @override
  String get chat_replied_yourself => 'yourself';

  @override
  String get sign_login_title => 'Login';

  @override
  String get sign_login_email => 'Email';

  @override
  String get sign_login_password => 'Password';

  @override
  String get sign_login_forgotPassword => 'Forgot password?';

  @override
  String get sign_login_noAccount => 'Don\'t have an account?';

  @override
  String get sign_login_signupNow => 'Sign up now';

  @override
  String get sign_login_error => 'Login Error';

  @override
  String get sign_signup_title => 'Sign up';

  @override
  String get sign_signup_username => 'Username';

  @override
  String get sign_signup_email => 'Email';

  @override
  String get sign_signup_password => 'Password';

  @override
  String get sign_signup_success => 'Signup success';

  @override
  String get sign_signup_error => 'Signup fail';

  @override
  String get sign_forgot_title => 'Reset password';

  @override
  String get sign_forgot_email => 'Email';

  @override
  String get sign_forgot_success =>
      'Your request was successful! Please check your email to reset your password.';

  @override
  String get account_logout => 'Logout';

  @override
  String get account_logout_confirm => 'Are you sure you would like to logout?';

  @override
  String get account_removeAccount => 'Remove Account';

  @override
  String get account_removeAccount_confirm =>
      'Are you sure you would like to remove account? Your profile will be cleared';

  @override
  String get account_profile => 'User Profile';

  @override
  String get account_changePassword => 'Change password';

  @override
  String get account_address => 'Address';

  @override
  String get common_pageNotFound => 'Page not found';

  @override
  String get last_line => '';
}
