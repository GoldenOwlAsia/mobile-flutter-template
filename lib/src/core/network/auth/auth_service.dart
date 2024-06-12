import 'package:dio/dio.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';

abstract class AuthService {
  Future<Response> signIn(SignInRequest request);

  Future<Response> signUp(SignUpRequest entity);

  Future<Response> signOut();

  Future<Response> removeAccount();

  Future<Response> forgotPassword(String email);
}
