// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:myapp/src/features/account/profile/view/profile_view.dart'
    as _i8;
import 'package:myapp/src/features/account/view/account_view.dart' as _i10;
import 'package:myapp/src/features/account/view/account_wrapper_view.dart'
    as _i9;
import 'package:myapp/src/features/authentication/router/sign_wrapper_view.dart'
    as _i14;
import 'package:myapp/src/features/authentication/view/forgot_view.dart'
    as _i12;
import 'package:myapp/src/features/authentication/view/signin_view.dart'
    as _i13;
import 'package:myapp/src/features/authentication/view/signup_view.dart'
    as _i11;
import 'package:myapp/src/features/common/view/not_found_view.dart' as _i4;
import 'package:myapp/src/features/dashboard/view/dashboard_view.dart' as _i3;
import 'package:myapp/src/features/home/view/home_view.dart' as _i2;
import 'package:myapp/src/features/sample/router/sample_wrapper_view.dart'
    as _i7;
import 'package:myapp/src/features/sample/view/sample_detail_view.dart' as _i6;
import 'package:myapp/src/features/sample/view/sample_list_view.dart' as _i5;
import 'package:myapp/src/features/settings/settings_view.dart' as _i1;

abstract class $XRouter extends _i15.RootStackRouter {
  $XRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsView(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoardView(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NotFoundView(),
      );
    },
    SampleItemListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SampleItemListView(),
      );
    },
    SampleItemDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SampleItemDetailsRouteArgs>(
          orElse: () =>
              SampleItemDetailsRouteArgs(id: pathParams.getString('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SampleItemDetailsView(
          id: args.id,
          key: args.key,
        ),
      );
    },
    SampleRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SampleWrapperView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AccountWrapperView(),
      );
    },
    AccountHomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AccountHomeView(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignupView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ForgotPasswordView(),
      );
    },
    SigninRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SigninView(),
      );
    },
    SignRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignWrapperView(),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsView]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeRouter extends _i15.PageRouteInfo<void> {
  const HomeRouter({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashBoardView]
class DashBoardRoute extends _i15.PageRouteInfo<void> {
  const DashBoardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NotFoundView]
class NotFoundRoute extends _i15.PageRouteInfo<void> {
  const NotFoundRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SampleItemListView]
class SampleItemListRoute extends _i15.PageRouteInfo<void> {
  const SampleItemListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SampleItemListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SampleItemListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SampleItemDetailsView]
class SampleItemDetailsRoute
    extends _i15.PageRouteInfo<SampleItemDetailsRouteArgs> {
  SampleItemDetailsRoute({
    required String id,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SampleItemDetailsRoute.name,
          args: SampleItemDetailsRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SampleItemDetailsRoute';

  static const _i15.PageInfo<SampleItemDetailsRouteArgs> page =
      _i15.PageInfo<SampleItemDetailsRouteArgs>(name);
}

class SampleItemDetailsRouteArgs {
  const SampleItemDetailsRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SampleItemDetailsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i7.SampleWrapperView]
class SampleRoute extends _i15.PageRouteInfo<void> {
  const SampleRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SampleRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AccountWrapperView]
class AccountRoute extends _i15.PageRouteInfo<void> {
  const AccountRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AccountHomeView]
class AccountHomeRoute extends _i15.PageRouteInfo<void> {
  const AccountHomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountHomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignupView]
class SignupRoute extends _i15.PageRouteInfo<void> {
  const SignupRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ForgotPasswordView]
class ForgotPasswordRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SigninView]
class SigninRoute extends _i15.PageRouteInfo<void> {
  const SigninRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignWrapperView]
class SignRoute extends _i15.PageRouteInfo<void> {
  const SignRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
