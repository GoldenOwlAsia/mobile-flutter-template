import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/resources/use_case.dart';
import 'package:myapp/src/features/authentication/forgot/domain/repositories/forgot_repository.dart';

@lazySingleton
class ForgotUseCase extends UseCase<DataState, String> {
  final ForgotRepository _repository;

  ForgotUseCase(this._repository);

  @override
  Future<DataState> call({required String params}) {
    return _repository.forgotPassword(params);
  }
}
