import 'package:flutter/material.dart';

class TechChipWidget extends StatelessWidget {
  const TechChipWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      labelPadding: EdgeInsets.zero,
      side: BorderSide.none,
      shape: const StadiumBorder(),
      backgroundColor: Theme.of(context).primaryColorLight,
    );
  }
}
