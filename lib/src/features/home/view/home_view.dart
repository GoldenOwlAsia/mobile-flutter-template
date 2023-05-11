import 'package:flutter/material.dart';
import 'package:myapp/src/dialogs/toast_wrapper.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/widgets/button/text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            XTextButton(
              title: 'Show Toast',
              onPressed: () {
                XToast.show('Clicked');
              },
            ),
            const XTextButton(
              title: 'Show sample view',
              onPressed: XCoordinator.showSampleScreen,
            ),
          ],
        ),
      ),
    );
  }
}
