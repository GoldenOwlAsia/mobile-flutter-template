import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetUserUseCase extends UseCase<DataState<UserModel>, String> {
  final AccountRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required String params}) {
    return _repository.getUser(params);
  }
}
