import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/dialogs/alert_wrapper.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/router/coordinator.dart';
import 'package:myapp/src/core/formz/email_fromz.dart';
import 'package:myapp/src/features/authentication/forgot/domain/use_cases/forgot_use_case.dart';

part 'forgot_state.dart';

@injectable
class ForgotBloc extends Cubit<ForgotState> {
  ForgotBloc(this._forgotUseCase) : super(const ForgotState());

  final ForgotUseCase _forgotUseCase;

  /// Step 3 (Register)
  Future onEnteredConfirmPassword(BuildContext context) async {
    if (state.email.isValid == false || state.status.isInProgress) {
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _forgotUseCase.call(params: state.email.value);
    if (result is DataSuccess) {
      await XAlert.show(
        body:
            'Your request success! Please check your email to reset your password',
      );
      AppCoordinator.pop(true);
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: result.error,
        ),
      );
    }
  }

  void onEmailChanged(String value) {
    final email = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: email));
  }
}
