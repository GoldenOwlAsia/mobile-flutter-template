import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurfaceVariant,
      ),
      body: Center(
        child: Text(
          'Page not found',
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
