import 'package:flutter/material.dart';

class CountUnseenBadge extends StatelessWidget {
  const CountUnseenBadge({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
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
