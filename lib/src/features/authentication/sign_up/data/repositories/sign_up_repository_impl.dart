import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/network/auth/auth_service.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl extends SignUpRepository {
  final AuthService _authService;

  SignUpRepositoryImpl(this._authService);

  @override
  Future<DataState<UserModel>> signUpWithEmailPassword(
      SignUpRequest entity) async {
    try {
      final response = await _authService.signUp(entity);
      UserModel user = UserModel.fromJson(response.data);
      return DataSuccess(user);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
