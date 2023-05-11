import 'package:flutter/material.dart';
import 'package:myapp/src/dialogs/widget/alert_dialog.dart';
import 'package:myapp/src/features/force_update/popup_force_update.dart';
import 'package:myapp/src/router/coordinator.dart';

class XAlert {
  static get context => XCoordinator.context;

  /// show the dialog
  static Future<String?> show({
    String? title,
    String? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          title: title,
          content: body,
          actions: actions,
        );
      },
    );
  }

  /// Shows a confirmation dialog
  Future showCustomAlert({
    Widget? title,
    Widget? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          titleWidget: title,
          contentWidget: body,
          actions: actions,
        );
      },
    );
  }

  static Future showForceUpdate() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          child: PopupForceUpdateApp(),
        );
      },
    );
  }
}
