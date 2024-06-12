import 'package:flutter/material.dart';

class AppDecorations {
  AppDecorations._();

  static final shadow = [
    BoxShadow(
      offset: const Offset(2, 2),
      blurRadius: 2,
      color: Colors.black.withOpacity(.1),
    ),
  ];

  static const InputDecoration inputNoneBorder = InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
  );
}
