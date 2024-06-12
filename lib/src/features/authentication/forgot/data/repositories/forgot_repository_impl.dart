import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/network/auth/auth_service.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/authentication/forgot/domain/repositories/forgot_repository.dart';

@LazySingleton(as: ForgotRepository)
class ForgotRepositoryImpl extends ForgotRepository {
  ForgotRepositoryImpl(this._authService);

  final AuthService _authService;

  @override
  Future<DataState> forgotPassword(String email) async {
    try {
      final response = await _authService.forgotPassword(email);
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
