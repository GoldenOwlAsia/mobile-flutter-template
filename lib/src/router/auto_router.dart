import 'package:auto_route/auto_route.dart';
import 'package:myapp/src/features/account/router/account_router.dart';
import 'package:myapp/src/features/authentication/router/sign_router.dart';
import 'package:myapp/src/features/sample/router/sample_router.dart';
import 'package:myapp/src/router/auto_router.gr.dart';
import 'package:myapp/src/router/router_name.dart';

// https://plugins.jetbrains.com/plugin/21071-autoroute-helper
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class XRouter extends $XRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: DashBoardRoute.page,
      path: '/',
      children: [
        AutoRoute(path: XRouteTaps.home, page: HomeRoute.page),
        AccountCoordinator.autoRouter,
      ],
    ),
    AutoRoute(path: XRoutes.setting, page: SettingsRoute.page),
    SampleCoordinator.autoRouter,
    SignCoordinator.autoRouter,
    AutoRoute(path: XRoutes.notFound, page: NotFoundRoute.page),
    RedirectRoute(path: '*', redirectTo: ''),
  ];
}
