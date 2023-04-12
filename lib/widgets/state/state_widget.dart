import 'package:flutter/material.dart';
import 'package:myapp/src/network/model/common/handle.dart';
import 'package:myapp/widgets/state/state_error_widget.dart';
import 'package:myapp/widgets/state/state_loading_widget.dart';

class XStateWidget extends StatelessWidget {
  const XStateWidget(this.handle, {this.onReload, this.child, Key? key})
      : super(key: key);
  final MHandle handle;
  final Widget? child;
  final VoidCallback? onReload;
  @override
  Widget build(BuildContext context) {
    if (handle.isLoading) {
      return const XStateLoadingWidget();
    } else if (handle.isCompleted) {
      return child ?? const Text('Success');
    }
    return XStateErrorWidget(onReload: onReload);
  }
}
