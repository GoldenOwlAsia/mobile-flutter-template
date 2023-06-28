import 'dart:async';
import 'package:flutter/material.dart';

import '../../src/network/model/common/handle.dart';
import '../../src/network/model/common/pagination/pagination.dart';
import '../common/indicator.dart';

class XStatePaginationWidget extends StatelessWidget {
  const XStatePaginationWidget({
    required this.page,
    required this.loadMore,
    this.autoLoad = true,
    Key? key,
  }) : super(key: key);
  final MPagination page;
  final Function() loadMore;
  final bool autoLoad;

  @override
  Widget build(BuildContext context) {
    if (page.canNext && autoLoad) {
      Timer(
        const Duration(milliseconds: 50),
        loadMore,
      );
    }
    if (page.status == MStatus.loading) {
      return const XIndicator();
    } else if (page.hasMore == false) {
      return const Text('');
    } else if (page.status == MStatus.failure) {
      return InkWell(
        onTap: loadMore,
        child: const Text(
          'Something went wrong',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// Use for last item of Gird
class XBoxLoadMore extends StatelessWidget {
  const XBoxLoadMore({
    required this.page,
    required this.loadMore,
    this.child,
    Key? key,
  }) : super(key: key);
  final MPagination page;
  final Function() loadMore;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (page.canNext) {
      Timer(
        const Duration(milliseconds: 50),
        loadMore,
      );
    }
    return SizedBox(child: child);
  }
}
