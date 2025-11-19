import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:myapp/preview/helper/helper.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/button/model/button_size.dart';
import 'package:myapp/widgets/button/outlined_button.dart';
import 'package:myapp/widgets/button/secondary_button.dart';
import 'package:myapp/widgets/button/text_button.dart';

@Preview(
  name: 'Small',
  group: PreviewGroups.buttons,
  wrapper: commonContainerWrapper,
)
Widget buttonsSmall() {
  final size = ButtonSize.small();
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      XButton(title: 'Button', size: size),
      const SizedBox(height: 12),
      XButton(title: 'Button', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XSecondaryButton(title: 'Secondary', size: size),
      const SizedBox(height: 12),
      XSecondaryButton(
          title: 'Secondary', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XOutlinedButton(title: 'Outlined', size: size),
      const SizedBox(height: 12),
      XOutlinedButton(
          title: 'Outlined', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XTextButton(title: 'Text Button', size: size),
      const SizedBox(height: 12),
      XTextButton(
          title: 'Text Button', icon: const Icon(Icons.add), size: size),
    ],
  );
}

@Preview(
  name: 'Medium',
  group: PreviewGroups.buttons,
  wrapper: commonContainerWrapper,
)
Widget buttonsMedium() {
  final size = ButtonSize.medium();
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      XButton(title: 'Button', size: size),
      const SizedBox(height: 12),
      XButton(title: 'Button', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XSecondaryButton(title: 'Secondary', size: size),
      const SizedBox(height: 12),
      XSecondaryButton(
          title: 'Secondary', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XOutlinedButton(title: 'Outlined', size: size),
      const SizedBox(height: 12),
      XOutlinedButton(
          title: 'Outlined', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XTextButton(title: 'Text Button', size: size),
      const SizedBox(height: 12),
      XTextButton(
          title: 'Text Button', icon: const Icon(Icons.add), size: size),
    ],
  );
}

@Preview(
  name: 'Large',
  group: PreviewGroups.buttons,
  wrapper: commonContainerWrapper,
)
Widget buttonsLarge() {
  final size = ButtonSize.large();
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      XButton(title: 'Button', size: size),
      const SizedBox(height: 12),
      XButton(title: 'Button', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XSecondaryButton(title: 'Secondary', size: size),
      const SizedBox(height: 12),
      XSecondaryButton(
          title: 'Secondary', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XOutlinedButton(title: 'Outlined', size: size),
      const SizedBox(height: 12),
      XOutlinedButton(
          title: 'Outlined', icon: const Icon(Icons.add), size: size),
      const SizedBox(height: 12),
      XTextButton(title: 'Text Button', size: size),
      const SizedBox(height: 12),
      XTextButton(
          title: 'Text Button', icon: const Icon(Icons.add), size: size),
    ],
  );
}

@Preview(
  name: 'Loading',
  group: PreviewGroups.buttons,
  wrapper: commonContainerWrapper,
)
Widget buttonsLoading() {
  final size = ButtonSize.medium();
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      XButton(title: 'Button', busy: true, size: size),
      const SizedBox(height: 12),
      XSecondaryButton(title: 'Secondary', busy: true, size: size),
      const SizedBox(height: 12),
      XOutlinedButton(title: 'Outlined', busy: true, size: size),
      const SizedBox(height: 12),
      XTextButton(title: 'Text Button', busy: true, size: size),
    ],
  );
}

@Preview(
  name: 'Disabled',
  group: PreviewGroups.buttons,
  wrapper: commonContainerWrapper,
)
Widget buttonsDisabled() {
  final size = ButtonSize.medium();
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      XButton(title: 'Button', enabled: false, size: size),
      const SizedBox(height: 12),
      XSecondaryButton(title: 'Secondary', enabled: false, size: size),
      const SizedBox(height: 12),
      XOutlinedButton(title: 'Outlined', enabled: false, size: size),
      const SizedBox(height: 12),
      XTextButton(title: 'Text Button', enabled: false, size: size),
    ],
  );
}
