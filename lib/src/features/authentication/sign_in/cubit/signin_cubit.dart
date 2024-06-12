import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/dialogs/alert_wrapper.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/router/coordinator.dart';
import 'package:myapp/src/features/account/cubit/account_cubit.dart';
import 'package:myapp/src/core/formz/email_fromz.dart';
import 'package:myapp/src/core/formz/model_input.dart';
import 'package:myapp/src/core/models/social_type.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/core/models/social_user/social_user.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/request/sign_in_request.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_apple_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_facebook_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_google_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_apple_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_email_password_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_google_use_case.dart';

part 'signin_state.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(
    this._signInUseCase,
    this._signInWithGGUseCase,
    this._signInWithFacebookUseCase,
    this._signInWithAppleUseCase,
    this._connectBEWithAppleUseCase,
    this._connectBEWithFacebookUseCase,
    this._connectBEWithGoogleUseCase,
  ) : super(const SigninState());

  final SignInWithEmailPasswordUseCase _signInUseCase;
  final SignInWithGoogleUseCase _signInWithGGUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;
  final SignInWithAppleUseCase _signInWithAppleUseCase;
  final ConnectBEWithAppleUseCase _connectBEWithAppleUseCase;
  final ConnectBEWithFacebookUseCase _connectBEWithFacebookUseCase;
  final ConnectBEWithGoogleUseCase _connectBEWithGoogleUseCase;

  Future loginWithEmail() async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) return;

    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.email,
    ));
    final email = state.email.value;
    final password = state.password.value;
    final result = await _signInUseCase.call(
      params: SignInRequest(password: password, email: email),
    );
    return loginDecision(result);
  }

  Future loginWithGoogle() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.google,
    ));
    final result = await _signInWithGGUseCase.call();
    return loginSocialDecision(result, MSocialType.google);
  }

  Future loginWithApple() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.apple,
    ));
    final result = await _signInWithAppleUseCase.call();
    return loginSocialDecision(result, MSocialType.apple);
  }

  Future loginWithFacebook() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.facebook,
    ));
    final result = await _signInWithFacebookUseCase.call();
    return loginSocialDecision(result, MSocialType.facebook);
  }

  Future loginSocialDecision(
    DataState<MSocialUser> result,
    MSocialType socialType,
  ) async {
    if (result is DataSuccess) {
      final data = result.data!;
      if (socialType == MSocialType.google) {
        connectBEWithGoogle(data);
      } else if (socialType == MSocialType.facebook) {
        connectBEWithFacebook(data);
      } else if (socialType == MSocialType.apple) {
        connectBEWithApple(data);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: "Error", body: result.error);
    }
  }

  Future connectBEWithGoogle(MSocialUser user) async {
    final result = await _connectBEWithGoogleUseCase.call(params: user);
    return loginDecision(result, socialType: user.type);
  }

  Future connectBEWithFacebook(MSocialUser user) async {
    final result = await _connectBEWithFacebookUseCase.call(params: user);
    return loginDecision(result, socialType: user.type);
  }

  Future connectBEWithApple(MSocialUser user) async {
    final result = await _connectBEWithAppleUseCase(params: user);
    return loginDecision(result, socialType: user.type);
  }

  Future loginDecision(
    DataState<UserModel> result, {
    MSocialType? socialType,
  }) async {
    if (result is DataSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      GetIt.I<AccountCubit>().onLoginSuccess(result.data!);
      AppCoordinator.pop(true);
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
