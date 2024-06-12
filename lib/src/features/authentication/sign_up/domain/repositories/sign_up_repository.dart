import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';

abstract class SignUpRepository {
  Future<DataState<UserModel>> signUpWithEmailPassword(SignUpRequest entity);
}
