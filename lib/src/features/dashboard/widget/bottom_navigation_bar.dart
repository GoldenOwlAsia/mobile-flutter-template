import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/constants/navigation_bar_item.dart';
import 'package:myapp/src/features/dashboard/logic/dashboard_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, XNavigationBarItems>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.index,
          onDestinationSelected:
              context.read<DashboardBloc>().onDestinationSelected,
          destinations: XNavigationBarItems.values
              .map((e) =>
                  NavigationDestination(icon: Icon(e.icon), label: e.label))
              .toList(),
        );
      },
    );
  }
}
