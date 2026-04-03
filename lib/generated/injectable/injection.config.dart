// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:myapp/src/features/account/logic/account_bloc.dart' as _i646;
import 'package:myapp/src/features/authentication/logic/forgot_bloc.dart'
    as _i202;
import 'package:myapp/src/features/authentication/logic/signin_bloc.dart'
    as _i341;
import 'package:myapp/src/features/authentication/logic/signup_bloc.dart'
    as _i1039;
import 'package:myapp/src/features/settings/logic/setting_bloc.dart' as _i918;
import 'package:myapp/src/network/blob/data/upload_repository.dart' as _i219;
import 'package:myapp/src/network/blob/data/upload_repository_impl.dart'
    as _i294;
import 'package:myapp/src/network/data/sign/sign_repository.dart' as _i783;
import 'package:myapp/src/network/data/sign/sign_repository_impl.dart' as _i896;
import 'package:myapp/src/network/data/user/user_reference.dart' as _i204;
import 'package:myapp/src/network/data/user/user_repository.dart' as _i606;
import 'package:myapp/src/network/data/user/user_repository_impl.dart' as _i832;
import 'package:myapp/src/network/domain_manager.dart' as _i389;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i204.UserReference>(() => _i204.UserReference());
    gh.lazySingleton<_i918.SettingBloc>(() => _i918.SettingBloc());
    gh.factory<_i783.SignRepository>(() => _i896.SignRepositoryImpl());
    gh.factory<_i219.UploadRepository>(() => _i294.UploadRepositoryImpl());
    gh.factory<_i606.UserRepository>(
      () => _i832.UserRepositoryImpl(gh<_i204.UserReference>()),
    );
    gh.factory<_i389.DomainManager>(
      () => _i389.DomainManager(
        gh<_i606.UserRepository>(),
        gh<_i219.UploadRepository>(),
        gh<_i783.SignRepository>(),
      ),
    );
    gh.factory<_i202.ForgotBloc>(
      () => _i202.ForgotBloc(gh<_i389.DomainManager>()),
    );
    gh.lazySingleton<_i646.AccountBloc>(
      () => _i646.AccountBloc(gh<_i389.DomainManager>()),
    );
    gh.factory<_i341.SigninBloc>(
      () =>
          _i341.SigninBloc(gh<_i389.DomainManager>(), gh<_i646.AccountBloc>()),
    );
    gh.factory<_i1039.SignupBloc>(
      () =>
          _i1039.SignupBloc(gh<_i389.DomainManager>(), gh<_i646.AccountBloc>()),
    );
    return this;
  }
}
