import 'package:flutter/material.dart';

class CustomStyle {
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 0,
      blurRadius: 5,
      offset: const Offset(2, 2),
    ),
  ];
}
