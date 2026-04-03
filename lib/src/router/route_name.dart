enum AppRouteNames {
  home(path: '/', routeName: 'home'),
  account(path: '/account'),
  signIn(path: '/sign-in'),
  signUp(path: '/sign-up'),
  forgotPassword(path: '/forgot', routeName: 'forgotPassword'),
  sample(path: '/sample'),
  sampleDetails(path: 'sample-details', paramName: 'id'),
  profile(path: '/profile'),
  settings(path: '/settings'),
  photoView(path: '/photoView');

  const AppRouteNames({
    required this.path,
    String? routeName,
    this.paramName,
  }) : _routeName = routeName;

  final String path;
  final String? _routeName;
  final String? paramName;

  /// Falls back to deriving camelCase name from path (e.g. `/sign-in` -> `signIn`).
  String get routeName => _routeName ?? _routeNameFromPath;

  String get _routeNameFromPath {
    final stripped = path.replaceAll('/', '');
    return stripped.replaceAllMapped(
      RegExp(r'-(\w)'),
      (m) => m.group(1)!.toUpperCase(),
    );
  }

  String get subPath {
    if (path == '/') return path;
    return path.replaceFirst('/', '');
  }

  String get buildPathParam => '$path:$paramName';
  String get buildSubPathParam => '$subPath:$paramName';
}
