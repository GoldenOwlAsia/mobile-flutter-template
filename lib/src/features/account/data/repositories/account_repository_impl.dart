import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/network/auth/auth_service.dart';
import 'package:myapp/src/core/network/user/user_service.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/account/domain/repositories/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  final UserService _userService;
  final AuthService _authService;

  AccountRepositoryImpl(this._userService, this._authService);

  @override
  Future<DataState<UserModel>> getUser(String id) async {
    try {
      final response = await _userService.getUser(id);
      UserModel user = UserModel.fromJson(response.data);
      return DataSuccess(user);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> signOut(UserModel user) async {
    try {
      final response = await _authService.signOut();
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> removeAccount(UserModel user) {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }
}
