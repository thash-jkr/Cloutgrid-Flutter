import 'package:flutter/material.dart';

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
