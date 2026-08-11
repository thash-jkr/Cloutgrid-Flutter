import 'package:flutter/material.dart';

class SegmentedListItem extends StatelessWidget {
  final int index;
  final int count;
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? overline;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool selected;
  final Color? selectedColor;
  final bool danger;

  const SegmentedListItem({
    super.key,
    required this.index,
    required this.count,
    this.leading,
    this.trailing,
    required this.title,
    this.overline,
    this.subtitle,
    this.onTap,
    this.selected = false,
    this.selectedColor,
    this.danger = false,
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
    final textColor = danger
        ? Colors.red
        : (selected ? Colors.white : Colors.black);
    final mutedColor = selected ? Colors.white70 : Colors.grey;

    return Material(
      color: backgroundColor,
      elevation: 1,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              if (leading != null) ...[
                danger
                    ? IconTheme(
                        data: const IconThemeData(color: Colors.red),
                        child: leading!,
                      )
                    : leading!,
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (overline != null)
                      Text(
                        overline!,
                        style: TextStyle(fontSize: 12, color: mutedColor),
                      ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(fontSize: 12, color: mutedColor),
                      ),
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 16), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
