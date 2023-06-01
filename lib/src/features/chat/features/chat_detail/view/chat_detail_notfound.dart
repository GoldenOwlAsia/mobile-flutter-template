import 'package:flutter/material.dart';

class ChatDetailNotFound extends StatelessWidget {
  const ChatDetailNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Center(
        child: Text(
          'Page not found',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
