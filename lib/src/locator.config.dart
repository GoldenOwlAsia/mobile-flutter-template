// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:myapp/src/core/network/auth/auth_service.dart' as _i6;
import 'package:myapp/src/core/network/auth/auth_service_impl.dart' as _i7;
import 'package:myapp/src/core/network/user/user_service.dart' as _i10;
import 'package:myapp/src/core/network/user/user_service_impl.dart' as _i11;
import 'package:myapp/src/core/router/router.dart' as _i3;
import 'package:myapp/src/core/utils/helper/network_helper.dart' as _i5;
import 'package:myapp/src/features/account/cubit/account_cubit.dart' as _i31;
import 'package:myapp/src/features/account/data/repositories/account_repository_impl.dart'
    as _i25;
import 'package:myapp/src/features/account/domain/repositories/account_repository.dart'
    as _i24;
import 'package:myapp/src/features/account/domain/use_cases/get_user_use_case.dart'
    as _i27;
import 'package:myapp/src/features/account/domain/use_cases/remove_account_use_case.dart'
    as _i26;
import 'package:myapp/src/features/account/domain/use_cases/sign_out_use_case.dart'
    as _i28;
import 'package:myapp/src/features/authentication/forgot/cubit/forgot_bloc.dart'
    as _i30;
import 'package:myapp/src/features/authentication/forgot/data/repositories/forgot_repository_impl.dart'
    as _i9;
import 'package:myapp/src/features/authentication/forgot/domain/repositories/forgot_repository.dart'
    as _i8;
import 'package:myapp/src/features/authentication/forgot/domain/use_cases/forgot_use_case.dart'
    as _i14;
import 'package:myapp/src/features/authentication/sign_in/cubit/signin_cubit.dart'
    as _i32;
import 'package:myapp/src/features/authentication/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i16;
import 'package:myapp/src/features/authentication/sign_in/domain/repositories/sign_in_repository.dart'
    as _i15;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_apple_use_case.dart'
    as _i17;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_facebook_use_case.dart'
    as _i22;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/connect_be_with_google_use_case.dart'
    as _i21;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_apple_use_case.dart'
    as _i18;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_email_password_use_case.dart'
    as _i19;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_facebook_use_case.dart'
    as _i23;
import 'package:myapp/src/features/authentication/sign_in/domain/use_cases/sign_in_with_google_use_case.dart'
    as _i20;
import 'package:myapp/src/features/authentication/sign_up/cubit/signup_cubit.dart'
    as _i33;
import 'package:myapp/src/features/authentication/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i13;
import 'package:myapp/src/features/authentication/sign_up/domain/repositories/sign_up_repository.dart'
    as _i12;
import 'package:myapp/src/features/authentication/sign_up/domain/use_cases/sign_up_with_email_password_use_case.dart'
    as _i29;
import 'package:myapp/src/locator.dart' as _i34;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.NetworkHelper>(() => _i5.NetworkHelper());
    gh.lazySingleton<_i6.AuthService>(
        () => _i7.AuthServiceImpl(gh<_i5.NetworkHelper>()));
    gh.lazySingleton<_i8.ForgotRepository>(
        () => _i9.ForgotRepositoryImpl(gh<_i6.AuthService>()));
    gh.lazySingleton<_i10.UserService>(
        () => _i11.UserServiceImpl(gh<_i5.NetworkHelper>()));
    gh.lazySingleton<_i12.SignUpRepository>(
        () => _i13.SignUpRepositoryImpl(gh<_i6.AuthService>()));
    gh.lazySingleton<_i14.ForgotUseCase>(
        () => _i14.ForgotUseCase(gh<_i8.ForgotRepository>()));
    gh.lazySingleton<_i15.SignInRepository>(
        () => _i16.SignInRepositoryImpl(gh<_i6.AuthService>()));
    gh.lazySingleton<_i17.ConnectBEWithAppleUseCase>(
        () => _i17.ConnectBEWithAppleUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i18.SignInWithAppleUseCase>(
        () => _i18.SignInWithAppleUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i19.SignInWithEmailPasswordUseCase>(
        () => _i19.SignInWithEmailPasswordUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i20.SignInWithGoogleUseCase>(
        () => _i20.SignInWithGoogleUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i21.ConnectBEWithGoogleUseCase>(
        () => _i21.ConnectBEWithGoogleUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i22.ConnectBEWithFacebookUseCase>(
        () => _i22.ConnectBEWithFacebookUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i23.SignInWithFacebookUseCase>(
        () => _i23.SignInWithFacebookUseCase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i24.AccountRepository>(() => _i25.AccountRepositoryImpl(
          gh<_i10.UserService>(),
          gh<_i6.AuthService>(),
        ));
    gh.lazySingleton<_i26.RemoveAccountUseCase>(
        () => _i26.RemoveAccountUseCase(gh<_i24.AccountRepository>()));
    gh.lazySingleton<_i27.GetUserUseCase>(
        () => _i27.GetUserUseCase(gh<_i24.AccountRepository>()));
    gh.lazySingleton<_i28.SignOutUseCase>(
        () => _i28.SignOutUseCase(gh<_i24.AccountRepository>()));
    gh.lazySingleton<_i29.SignUpWithEmailPasswordUseCase>(
        () => _i29.SignUpWithEmailPasswordUseCase(gh<_i12.SignUpRepository>()));
    gh.factory<_i30.ForgotBloc>(
        () => _i30.ForgotBloc(gh<_i14.ForgotUseCase>()));
    gh.lazySingleton<_i31.AccountCubit>(() => _i31.AccountCubit(
          gh<_i27.GetUserUseCase>(),
          gh<_i28.SignOutUseCase>(),
          gh<_i26.RemoveAccountUseCase>(),
        ));
    gh.factory<_i32.SigninCubit>(() => _i32.SigninCubit(
          gh<_i19.SignInWithEmailPasswordUseCase>(),
          gh<_i20.SignInWithGoogleUseCase>(),
          gh<_i23.SignInWithFacebookUseCase>(),
          gh<_i18.SignInWithAppleUseCase>(),
          gh<_i17.ConnectBEWithAppleUseCase>(),
          gh<_i22.ConnectBEWithFacebookUseCase>(),
          gh<_i21.ConnectBEWithGoogleUseCase>(),
        ));
    gh.factory<_i33.SignupCubit>(
        () => _i33.SignupCubit(gh<_i29.SignUpWithEmailPasswordUseCase>()));
    return this;
  }
}

class _$InjectionModule extends _i34.InjectionModule {}
