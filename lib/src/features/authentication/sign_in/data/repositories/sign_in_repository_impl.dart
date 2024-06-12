import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/social_user/social_user.dart';
import 'package:myapp/src/core/models/user/user.dart';

import 'package:myapp/src/core/network/auth/auth_service.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/utils/prefs_utils.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl extends SignInRepository {
  final AuthService _authService;

  SignInRepositoryImpl(this._authService);

  @override
  Future<DataState<UserModel>> signInWithEmailPassword(
      SignInRequest entity) async {
    try {
      final response = await _authService.signIn(entity);
      UserModel user = UserModel.fromJson(response.data);
      PrefsUtils.I.setUser(user);
      PrefsUtils.I.setToken(response.headers.map["authorization"]?.first);
      return DataSuccess(user);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<MSocialUser>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<DataState<MSocialUser>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<DataState<MSocialUser>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserModel>> connectBEWithApple(MSocialUser user) {
    // TODO: implement connectBEWithApple
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserModel>> connectBEWithFacebook(MSocialUser user) {
    // TODO: implement connectBEWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserModel>> connectBEWithGoogle(MSocialUser user) {
    // TODO: implement connectBEWithGoogle
    throw UnimplementedError();
  }
}
