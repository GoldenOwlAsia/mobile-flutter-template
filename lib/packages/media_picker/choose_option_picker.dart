import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../src/localization/localization_utils.dart';
import '../../src/router/coordinator.dart';
import 'model/request_type.ext.dart';

class ChooseOptionPicker {
  static Future<PickerFromType?> show(
      BuildContext context, RequestType type) async {
    return await showCupertinoModalPopup<PickerFromType>(
      context: AppCoordinator.context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(type.titleOf),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop(PickerFromType.camera);
              },
              child: Text(type.optionCameraOf),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop(PickerFromType.gallery);
              },
              child: Text(type.optionGalleryOf),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              S.text.common_cancel,
            ),
          ),
        );
      },
    );
  }
}
