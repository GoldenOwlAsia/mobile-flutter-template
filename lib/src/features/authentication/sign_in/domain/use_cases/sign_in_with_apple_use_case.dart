import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/models/social_user/social_user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class SignInWithAppleUseCase extends UseCase<DataState<MSocialUser>, dynamic> {
  final SignInRepository _repository;

  SignInWithAppleUseCase(this._repository);

  @override
  Future<DataState<MSocialUser>> call({params}) {
    return _repository.signInWithApple();
  }
}
