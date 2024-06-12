import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';

abstract class AccountRepository {
  Future<DataState<UserModel>> getUser(String id);

  Future<DataState> signOut(UserModel user);

  Future<DataState> removeAccount(UserModel user);
}
