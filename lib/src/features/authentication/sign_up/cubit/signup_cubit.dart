import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/dialogs/alert_wrapper.dart';
import 'package:myapp/src/core/dialogs/toast_wrapper.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/router/coordinator.dart';
import 'package:myapp/src/features/account/cubit/account_cubit.dart';
import 'package:myapp/src/core/formz/email_fromz.dart';
import 'package:myapp/src/core/formz/model_input.dart';
import 'package:myapp/src/core/formz/name_formz.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/request/sign_up_request.dart';
import 'package:myapp/src/features/authentication/sign_up/domain/use_cases/sign_up_with_email_password_use_case.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signUpWithEmailPasswordUseCase)
      : super(const SignupState());

  final SignUpWithEmailPasswordUseCase _signUpWithEmailPasswordUseCase;

  Future signupWithEmail(BuildContext context) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final email = state.email.value;
    final password = state.password.value;
    final name = state.name.value;
    final result = await _signUpWithEmailPasswordUseCase.call(
      params: SignUpRequest(
        email: email,
        password: password,
        name: name,
      ),
    );
    if (result is DataSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      if (context.mounted) {
        signupDecision(context, result.data!);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: 'Signup fail', body: result.error);
    }
  }

  Future signupDecision(BuildContext context, UserModel incomingUser) async {
    GetIt.I<AccountCubit>().onLoginSuccess(incomingUser);
    AppCoordinator.pop();
    XToast.success('Signup success');
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onNameChanged(String value) {
    final formz = NameFormzInput.dirty(value);
    emit(state.copyWith(name: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}
