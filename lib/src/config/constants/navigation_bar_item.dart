import 'package:flutter/material.dart';
import 'package:myapp/src/router/route_name.dart';

enum XNavigationBarItems {
  home(
    label: 'Home',
    route: XRouteNames.home,
    icon: Icons.home,
  ),
  account(
    label: 'Account',
    route: XRouteNames.account,
    icon: Icons.people,
  );

  const XNavigationBarItems({
    required this.label,
    required this.route,
    required this.icon,
  });

  final String label;
  final XRouteNames route;
  final IconData icon;

  static XNavigationBarItems fromLocation(String location) {
    if (location == XNavigationBarItems.home.route.name) {
      return XNavigationBarItems.home;
    }

    return XNavigationBarItems.home;
  }
}
