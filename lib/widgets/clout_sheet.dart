import 'package:flutter/material.dart';

Future<void> cloutSheet(BuildContext context, {required Widget content}) {
  final topInset = MediaQuery.of(context).padding.top;

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height - topInset,
    ),
    builder: (context) => content,
  );
}
