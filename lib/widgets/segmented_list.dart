import 'package:flutter/material.dart';

class SegmentedListItem extends StatelessWidget {
  final int index;
  final int count;
  final Widget? leading;
  final Widget? trailing;
  final Widget child;
  final VoidCallback? onTap;

  const SegmentedListItem({
    super.key,
    required this.index,
    required this.count,
    this.leading,
    this.trailing,
    required this.child,
    this.onTap,
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

    return Material(
      color: Colors.white,
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
