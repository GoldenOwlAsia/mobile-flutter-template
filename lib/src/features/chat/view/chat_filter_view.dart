import 'package:flutter/material.dart';

class ChatFilterView extends StatelessWidget {
  const ChatFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {},
        ),
      ],
    );
  }
}
