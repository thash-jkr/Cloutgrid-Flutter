import 'package:flutter/material.dart';

Future<void> cloutSheet(
  BuildContext context, {
  required Widget content,
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
    builder: (context) => content,
  );
}
