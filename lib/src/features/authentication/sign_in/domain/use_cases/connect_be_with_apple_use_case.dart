import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/social_user/social_user.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class ConnectBEWithAppleUseCase
    extends UseCase<DataState<UserModel>, MSocialUser> {
  final SignInRepository _repository;

  ConnectBEWithAppleUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required MSocialUser params}) {
    return _repository.connectBEWithApple(params);
  }
}
