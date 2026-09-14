import 'dart:io';

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

class XLoadingAlert extends StatelessWidget {
  const XLoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: _indicator(context),
      ),
    );
  }

  Widget _indicator(BuildContext context) {
    const double radius = 15;
    if (kIsWeb || Platform.isAndroid) {
      return const SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      );
    }
    return const CupertinoActivityIndicator(radius: radius);
  }
}
