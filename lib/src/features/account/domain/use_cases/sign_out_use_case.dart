import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class SignOutUseCase extends UseCase<DataState, UserModel> {
  final AccountRepository _repository;

  SignOutUseCase(this._repository);

  @override
  Future<DataState> call({required UserModel params}) {
    return _repository.signOut(params);
  }
}
