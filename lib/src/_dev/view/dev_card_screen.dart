import 'package:flutter/material.dart';
import '../widget/dev_screen_layout.dart';

class DevCardScreen extends StatelessWidget {
  const DevCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DevScreenLayout(
      'Card',
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [],
    );
  }
}
