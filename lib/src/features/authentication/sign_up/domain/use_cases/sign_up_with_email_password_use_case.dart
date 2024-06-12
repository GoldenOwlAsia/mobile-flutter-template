import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';

@lazySingleton
class SignUpWithEmailPasswordUseCase
    extends UseCase<DataState<UserModel>, SignUpRequest> {
  final SignUpRepository _repository;

  SignUpWithEmailPasswordUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required SignUpRequest params}) {
    return _repository.signUpWithEmailPassword(params);
  }
}
