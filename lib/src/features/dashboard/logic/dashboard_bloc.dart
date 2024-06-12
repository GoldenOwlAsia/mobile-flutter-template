import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/core/dialogs/alert_wrapper.dart';
import 'package:myapp/src/core/router/coordinator.dart';
import 'package:myapp/src/core/services/remote_config/remote_config_service.dart';
import 'navigation_bar_item.dart';

class DashboardBloc extends Cubit<XNavigationBarItems> {
  DashboardBloc(super.current) {
    checkForceUpdate();
  }

  Future checkForceUpdate() async {
    final needForceUpdate = await RemoteConfigService.config.needForceUpdate();
    if (needForceUpdate) {
      XAlert.showForceUpdate();
      return true;
    }
    return false;
  }

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    AppCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    AppCoordinator.goNamed(state.route.name);
  }
}
