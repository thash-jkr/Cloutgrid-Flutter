import 'package:flutter/material.dart';
import 'dart:async';

class CloutAlert {
  CloutAlert._();

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String body,
    bool hasTextField = false,
    bool timed = false,
    required void Function(String? text) onSubmit,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => _CloutAlertDialog(
        title: title,
        body: body,
        hasTextField: hasTextField,
        timed: timed,
        onSubmit: onSubmit,
      ),
    );
  }
}

class _CloutAlertDialog extends StatefulWidget {
  final String title;
  final String body;
  final bool hasTextField;
  final void Function(String? text) onSubmit;
  final bool timed;

  const _CloutAlertDialog({
    required this.title,
    required this.body,
    required this.hasTextField,
    required this.timed,
    required this.onSubmit,
  });

  @override
  State<_CloutAlertDialog> createState() => _CloutAlertDialogState();
}

class _CloutAlertDialogState extends State<_CloutAlertDialog> {
  static const _countdownSeconds = 10;

  TextEditingController? _controller;
  Timer? _timer; // ADD
  int _secondsLeft = _countdownSeconds; // ADD

  @override
  void initState() {
    super.initState();
    if (widget.hasTextField) {
      _controller = TextEditingController();
    }
    if (widget.timed) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() => _secondsLeft--);
        if (_secondsLeft <= 0) timer.cancel();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // ADD
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final confirmEnabled = !widget.timed || _secondsLeft <= 0;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.body,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          if (widget.hasTextField) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              autofocus: true,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write here...",
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(width: 10),

        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red.withValues(alpha: 0.1),
            disabledBackgroundColor: Colors.red.withValues(alpha: 0.05),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: confirmEnabled
              ? () {
                  Navigator.pop(context);
                  widget.onSubmit(_controller?.text);
                }
              : null, // null disables the button
          child: Text(
            confirmEnabled ? "Confirm" : "Confirm ($_secondsLeft)",
            style: TextStyle(
              color: confirmEnabled
                  ? Colors.red
                  : Colors.red.withValues(alpha: 0.4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
