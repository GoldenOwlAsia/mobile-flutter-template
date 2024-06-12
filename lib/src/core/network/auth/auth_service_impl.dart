import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/network/api_endpoint.dart';
import 'package:myapp/src/core/network/auth/auth_service.dart';
import 'package:myapp/src/core/utils/helper/network_helper.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl extends AuthService {
  final NetworkHelper _networkUtil;

  AuthServiceImpl(this._networkUtil);

  @override
  Future<Response> signIn(SignInRequest request) async {
    final response =
        await _networkUtil.post(APIEndpoint.signIn, data: request.toJson());
    return response;
  }

  @override
  Future<Response> signUp(SignUpRequest entity) async {
    final response =
        await _networkUtil.post(APIEndpoint.signUp, data: entity.toJson());
    return response;
  }

  @override
  Future<Response> signOut() async {
    final response = await _networkUtil.delete(APIEndpoint.signOut);
    return response;
  }

  @override
  Future<Response> forgotPassword(String email) async {
    final response = await _networkUtil.put(APIEndpoint.forgotPassword);
    return response;
  }

  @override
  Future<Response> removeAccount() {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }
}
