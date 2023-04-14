// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/social_type.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/network/model/social_user.dart';
import 'package:myapp/src/network/model/user.dart';
import 'package:myapp/src/router/auto_router.dart';

part 'signin_state.dart';

class SigninBloc extends Cubit<SigninState> {
  SigninBloc() : super(const SigninState());

  DomainManager get domain => DomainManager.I;

  Future loginWithEmail(BuildContext context) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) {
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.email,
    ));
    final email = state.email.value;
    final password = state.password.value;
    final result =
        await domain.sign.loginWithEmail(email: email, password: password);
    return loginDecision(context, result);
  }

  Future loginWithGoogle(BuildContext context) async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.google,
    ));
    final result = await domain.sign.loginWithGoogle();
    return loginSocialDecision(context, result, MSocialType.google);
  }

  Future loginWithApple(BuildContext context) async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.apple,
    ));
    final result = await domain.sign.loginWithApple();
    return loginSocialDecision(context, result, MSocialType.apple);
  }

  Future loginWithFacebook(BuildContext context) async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.facebook,
    ));
    final result = await domain.sign.loginWithFacebook();
    return loginSocialDecision(context, result, MSocialType.facebook);
  }

  Future loginSocialDecision(BuildContext context, MResult<MSocialUser> result,
      MSocialType socialType) async {
    if (result.isSuccess) {
      if (socialType == MSocialType.google) {
        connectBEWithGoogle(context, result.data!);
      } else if (socialType == MSocialType.facebook) {
        connectBEWithFacebook(context, result.data!);
      } else if (socialType == MSocialType.apple) {
        connectBEWithApple(context, result.data!);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: "Error", body: result.error);
    }
  }

  Future connectBEWithGoogle(BuildContext context, MSocialUser user) async {
    final result = await domain.sign.connectBEWithGoogle(user);
    return loginDecision(context, result, socialType: user.type);
  }

  Future connectBEWithFacebook(BuildContext context, MSocialUser user) async {
    final result = await domain.sign.connectBEWithFacebook(user);
    return loginDecision(context, result, socialType: user.type);
  }

  Future connectBEWithApple(BuildContext context, MSocialUser user) async {
    final result = await domain.sign.connectBEWithApple(user);
    return loginDecision(context, result, socialType: user.type);
  }

  Future loginDecision(BuildContext context, MResult<MUser> result,
      {MSocialType? socialType}) async {
    final user = result.data;
    if (result.isSuccess && user != null) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      GetIt.I<AccountBloc>().onLoginSuccess(user);
      GetIt.I<XRouter>().pop(true);
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: 'Login Error', body: result.error);
    }
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}