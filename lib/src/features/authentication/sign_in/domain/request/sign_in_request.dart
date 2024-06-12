class SignInRequest {
  String email;
  String password;

  SignInRequest({required this.password, required this.email});

  Map<String, dynamic> toJson() {
    return {
      "user": {"password": password, 'email': email}
    };
  }
}
