class APIEndpoint {
  APIEndpoint._();

  static String version = "api/v1/auth";

  static String signIn = "$version/sign_in";
  static String signUp = "$version/sign_up";
  static String signOut = "$version/sign_out";
  static String forgotPassword = "$version/forgot_password";

  static String user = "$version/user";
}
