import 'package:ecyzhi_flutter/config/styles.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.showShadow = true,
  });
  final Widget child;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: showShadow ? CustomStyle.cardShadow : null,
      ),
      child: child,
    );
  }
}
