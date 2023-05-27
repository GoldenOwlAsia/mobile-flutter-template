import 'package:flutter/material.dart';
import 'package:myapp/widgets/button/text_button.dart';

import '../../../widgets/button/button.dart';
import '../../../widgets/button/outlined_button.dart';
import '../widget/dev_screen_layout.dart';
import '../widget/dev_title.dart';

class DevButtonScreen extends StatefulWidget {
  const DevButtonScreen({Key? key}) : super(key: key);

  @override
  State<DevButtonScreen> createState() => _DevButtonScreenState();
}

class _DevButtonScreenState extends State<DevButtonScreen> {
  bool busy = false;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16);
    return DevScreenLayout(
      'Button',
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      children: [
        _title('Button State'),
        CheckboxListTile(
            title: const Text('Loading'),
            value: busy,
            onChanged: (val) {
              setState(() {
                busy = !busy;
              });
            }),
        CheckboxListTile(
            title: const Text('Enabled'),
            value: enabled,
            onChanged: (val) {
              setState(() {
                enabled = !enabled;
              });
            }),
        _title('1. Primary Button'),
        XButton(
          title: 'Button',
          busy: busy,
          enabled: enabled,
        ),
        spacer,
        XOutlinedButton(
          title: 'OutlinedButton',
          busy: busy,
          enabled: enabled,
        ),
        spacer,
        XTextButton(
          title: 'Text Action Button',
          onPressed: enabled ? () {} : null,
        ),
      ],
    );
  }

  Widget _title(String title) {
    return DevTitle(title, horizontalPadding: 0);
  }
}
