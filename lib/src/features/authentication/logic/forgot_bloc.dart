import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';

part 'forgot_state.dart';

@injectable
class ForgotBloc extends Cubit<ForgotState> {
  final DomainManager domain;

  ForgotBloc(this.domain) : super(const ForgotState());

  Future<void> onSubmitForgotPassword() async {
    if (state.email.isValid == false || state.status.isInProgress) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final MResult<String> result = await domain.sign.forgotPassword(
      state.email.value,
    );
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: result.error ?? '',
        ),
      );
    }
  }

  void onEmailChanged(String value) {
    final email = EmailFormzInput.pure(value);
    emit(state.copyWith(email: email));
  }
}
