import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CountUnseenBadge extends StatelessWidget {
  const CountUnseenBadge(
      {super.key,
      required this.count,
      this.backgroundColor = AppColors.primary});
  final int count;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: Text(count > 99 ? '99+' : count.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
