import 'package:flutter/material.dart';
import 'package:myapp/src/network/model/common/handle/handle.dart';
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
    return handle.when(
      initial: XStateLoadingWidget.new,
      loading: XStateLoadingWidget.new,
      complete: (result) => result.when(
        data: (data) => child ?? const Text('Success'),
        error: (e) => XStateErrorWidget(onReload: onReload),
      ),
    );
  }
}
