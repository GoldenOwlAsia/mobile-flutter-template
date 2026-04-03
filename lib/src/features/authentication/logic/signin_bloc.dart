import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/social_type.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/network/model/social_user/social_user.dart';
import 'package:myapp/src/network/model/user/user.dart';

part 'signin_state.dart';

@injectable
class SigninBloc extends Cubit<SigninState> {
  final DomainManager domain;
  final AccountBloc accountBloc;

  SigninBloc(this.domain, this.accountBloc) : super(const SigninState());

  Future<void> loginWithEmail() async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) return;

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        loginType: MSocialType.email,
      ),
    );
    final result = await domain.sign.loginWithEmail(
      email: state.email.value,
      password: state.password.value,
    );
    _handleLoginResult(result);
  }

  Future<void> loginWithGoogle() async {
    if (state.status.isInProgress) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        loginType: MSocialType.google,
      ),
    );
    final result = await domain.sign.loginWithGoogle();
    await _handleSocialResult(result, MSocialType.google);
  }

  Future<void> loginWithApple() async {
    if (state.status.isInProgress) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        loginType: MSocialType.apple,
      ),
    );
    final result = await domain.sign.loginWithApple();
    await _handleSocialResult(result, MSocialType.apple);
  }

  Future<void> loginWithFacebook() async {
    if (state.status.isInProgress) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        loginType: MSocialType.facebook,
      ),
    );
    final result = await domain.sign.loginWithFacebook();
    await _handleSocialResult(result, MSocialType.facebook);
  }

  Future<void> _handleSocialResult(
    MResult<MSocialUser> result,
    MSocialType socialType,
  ) async {
    if (result.isSuccess) {
      final data = result.data!;
      await _connectBEWithSocial(data, socialType);
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.error ?? '',
        ),
      );
    }
  }

  Future<void> _connectBEWithSocial(
    MSocialUser user,
    MSocialType socialType,
  ) async {
    final MResult<MUser> result;
    switch (socialType) {
      case MSocialType.google:
        result = await domain.sign.connectBEWithGoogle(user);
      case MSocialType.facebook:
        result = await domain.sign.connectBEWithFacebook(user);
      case MSocialType.apple:
        result = await domain.sign.connectBEWithApple(user);
      case MSocialType.email:
        return;
    }
    if (result.isSuccess) {
      final userResult = await domain.user.getOrAddUser(result.data!);
      _handleLoginResult(userResult);
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.error ?? '',
        ),
      );
    }
  }

  void _handleLoginResult(MResult<MUser> result) {
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

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}
