import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SignRoute')
class SignWrapperView extends StatelessWidget {
  const SignWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
