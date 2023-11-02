import 'package:flutter/material.dart';
import '../../dialogs/alert_wrapper.dart';
import '../../dialogs/toast_wrapper.dart';
import '../widget/dev_button_title.dart';
import '../widget/dev_screen_layout.dart';

class DevDialogScreen extends StatelessWidget {
  const DevDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Dialog',
      children: [
        DevButtonTitle('1. Show Dialog', onTap: () {
          XAlert.show(title: 'Dialog Title', body: 'Dialog content');
        }),
        DevButtonTitle('2. Show full screen loading', onTap: () async {
          XToast.showLoading();
          await Future.delayed(const Duration(seconds: 1));
          XToast.hideLoading();
        }),
      ],
    );
  }
}
