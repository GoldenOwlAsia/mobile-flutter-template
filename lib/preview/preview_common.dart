import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/preview/helper/helper.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/state/state_empty_widget.dart';
import 'package:myapp/widgets/state/state_error_widget.dart';
import 'package:myapp/widgets/state/state_loading_widget.dart';

@Preview(
  name: 'Error State',
  group: PreviewGroups.commonStates,
  wrapper: commonScaffoldWrapper,
)
Widget errorState() {
  return Center(
    child: XStateErrorWidget(
      onTap: () {},
    ),
  );
}

@Preview(
  name: 'Loading State',
  group: PreviewGroups.commonStates,
  wrapper: commonScaffoldWrapper,
)
Widget loadingState() {
  return const Center(
    child: XStateLoadingWidget(),
  );
}

@Preview(
  name: 'Empty List',
  group: PreviewGroups.commonStates,
  wrapper: commonScaffoldWrapper,
)
Widget emptyListState() {
  return const Center(
    child: XStateEmptyWidget(
      title: 'No items found',
      body: "Keep browsing for more products",
    ),
  );
}

@Preview(
  name: 'Empty Notification',
  group: PreviewGroups.commonStates,
  wrapper: commonScaffoldWrapper,
)
Widget emptyNotificationState() {
  return XStateEmptyWidget(
    iconSvg: Assets.svgs.stateEmptyNotification.path,
    title: 'No notifications yet',
    body: "You're all caught up!\n Check back later for new notifications",
    bottom: Center(
      child: XButton(
        title: 'Back to home',
        onPressed: () {},
      ),
    ),
  );
}
