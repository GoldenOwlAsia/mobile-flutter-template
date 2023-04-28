import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/constants/navigation_bar_item.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/services/remote_config/remote_config_service.dart';

class DashboardBloc extends Cubit<XNavigationBarItems> {
  DashboardBloc(XNavigationBarItems current) : super(current) {
    checkForceUpdate();
  }

  Future checkForceUpdate() async {
    final needForceUpdate = RemoteConfigService.config.needForceUpdate;
    if (needForceUpdate) {
      XAlert.showForceUpdate();
      return true;
    }
    return false;
  }

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    XCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    XCoordinator.goNamed(state.route.name);
  }
}
