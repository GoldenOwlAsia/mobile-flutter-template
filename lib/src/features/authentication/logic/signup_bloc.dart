import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/features/authentication/model/name_formz.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

@injectable
class SignupBloc extends Cubit<SignupState> {
  final DomainManager domain;
  final AccountBloc accountBloc;

  SignupBloc(this.domain, this.accountBloc) : super(const SignupState());

  Future<void> signupWithEmail() async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await domain.sign.signUpWithEmail(
      email: state.email.value,
      password: state.password.value,
      name: state.name.value,
    );
    if (result.isSuccess) {
      accountBloc.onLoginSuccess(result.data!);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.error ?? '',
        ),
      );
    }
  }

  void onEmailChanged(String value) {
    final formz = EmailFormzInput.pure(value);
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
