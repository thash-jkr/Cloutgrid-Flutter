import 'package:flutter/material.dart';

import 'category_list.dart';

class CloutCapsule extends StatelessWidget {
  final String content;

  const CloutCapsule(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryLabel = CategoryList.labelFor(content);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Text(
        categoryLabel,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
