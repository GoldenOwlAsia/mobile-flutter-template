import 'package:flutter/material.dart';
import 'package:myapp/src/router/coordinator.dart';
import '../../../../gen/assets.gen.dart';

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
            title: Text('SampleItem $index'),
            leading: CircleAvatar(
              foregroundImage: AssetImage(Assets.images.images.logo.path),
            ),
            onTap: () => AppCoordinator.showSampleDetails(id: '$index'),
          );
        },
      ),
    );
  }
}
