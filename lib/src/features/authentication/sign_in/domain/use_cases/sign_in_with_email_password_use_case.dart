import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';

@lazySingleton
class SignInWithEmailPasswordUseCase
    extends UseCase<DataState<UserModel>, SignInRequest> {
  final SignInRepository _repository;

  SignInWithEmailPasswordUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required SignInRequest params}) {
    return _repository.signInWithEmailPassword(params);
  }
}
