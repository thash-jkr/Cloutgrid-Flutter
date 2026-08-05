import 'package:flutter/material.dart';

class SegmentedListItem extends StatelessWidget {
  final int index;
  final int count;
  final Widget? leading;
  final Widget? trailing;
  final Widget child;
  final VoidCallback? onTap;
  final bool selected;
  final Color? selectedColor;

  const SegmentedListItem({
    super.key,
    required this.index,
    required this.count,
    this.leading,
    this.trailing,
    required this.child,
    this.onTap,
    this.selected = false,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    late final BorderRadius borderRadius;

    if (count == 1) {
      borderRadius = BorderRadius.all(radius);
    } else if (index == 0) {
      borderRadius = const BorderRadius.vertical(top: radius);
    } else if (index == count - 1) {
      borderRadius = const BorderRadius.vertical(bottom: radius);
    } else {
      borderRadius = BorderRadius.zero;
    }

    final theme = Theme.of(context);
    final backgroundColor = selected
        ? (selectedColor ?? theme.colorScheme.secondary)
        : Colors.white;

    return Material(
      color: backgroundColor,
      elevation: 0.1,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 16)],
              Expanded(child: child),
              if (trailing != null) ...[const SizedBox(width: 16), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
