import 'package:flutter/material.dart';

/// Bouncing everywhere except at the top edge, where it clamps instead —
/// so dragging down while already at the top of the list releases the
/// gesture to the modal sheet (triggering dismiss) rather than the list
/// consuming it as an overscroll bounce.
class SheetScrollPhysics extends BouncingScrollPhysics {
  const SheetScrollPhysics({super.parent});

  @override
  SheetScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SheetScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Only intervene when the drag would pull past the START (top) of
    // the list — leave the END (bottom) alone, so bounce there still works.
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels; // clamp: no overscroll generated here
    }
    return super.applyBoundaryConditions(
      position,
      value,
    ); // bounce as normal elsewhere
  }
}

Future<void> cloutSheet(
  BuildContext context, {
  required Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )
  content,
  bool short = false,
}) {
  final topInset = MediaQuery.of(context).padding.top;

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    constraints: BoxConstraints(
      maxHeight: short
          ? MediaQuery.of(context).size.height / 2
          : MediaQuery.of(context).size.height - topInset,
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 1.0,
      minChildSize: 0.01,
      maxChildSize: 1.0,
      snap: true,
      builder: (context, scrollController) =>
          content(context, scrollController),
    ),
  );
}
