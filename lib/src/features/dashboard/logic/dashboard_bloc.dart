import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'navigation_bar_item.dart';

class DashboardBloc extends Cubit<XNavigationBarItems> {
  DashboardBloc(super.current);

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    AppCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    AppCoordinator.goNamed(state.route.name);
  }
}
