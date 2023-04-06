import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/theme/images.dart';

@RoutePage()
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('SampleItem ${index}'),
            leading: const CircleAvatar(
              foregroundImage: AssetImage(XImagePath.logo),
            ),
            onTap: () {
              context.router.pushNamed('$index');
            },
          );
        },
      ),
    );
  }
}
