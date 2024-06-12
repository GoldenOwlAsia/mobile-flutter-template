import 'package:myapp/src/core/models/social_user/social_user.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';

abstract class SignInRepository {
  Future<DataState<UserModel>> signInWithEmailPassword(SignInRequest entity);

  Future<DataState<MSocialUser>> signInWithGoogle();

  Future<DataState<MSocialUser>> signInWithFacebook();

  Future<DataState<MSocialUser>> signInWithApple();

  Future<DataState<UserModel>> connectBEWithGoogle(MSocialUser user);

  Future<DataState<UserModel>> connectBEWithFacebook(MSocialUser user);

  Future<DataState<UserModel>> connectBEWithApple(MSocialUser user);
}
