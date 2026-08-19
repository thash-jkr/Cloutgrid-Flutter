import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CloutToast extends StatelessWidget {
  final String message;
  final bool isSuccess;
  final bool isLoading;

  const CloutToast({
    super.key,
    required this.message,
    this.isSuccess = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 40,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 0,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                width: 20,
                height: 20,
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: theme.colorScheme.secondary,
                  size: 20,
                ),
              )
            else
              Icon(
                isSuccess ? Icons.check_circle : Icons.warning_rounded,
                color: isSuccess ? Colors.green : Colors.red,
                size: 20,
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple, fixed-duration toast — unchanged behavior from before.
void showToast(
  BuildContext context, {
  required String message,
  bool isSuccess = true,
  Duration duration = const Duration(seconds: 2, milliseconds: 500),
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => _ToastOverlay(
      message: message,
      isSuccess: isSuccess,
      duration: duration,
      onDismissed: () => entry.remove(),
    ),
  );

  overlay.insert(entry);
}

/// Wraps an async [task]: shows a loading toast immediately (no
/// auto-dismiss while pending), then transitions to a success or error
/// message once the task completes, and auto-dismisses after [duration].
///
/// Returns true if [task] completed without throwing, false otherwise —
/// callers can still branch on this if they need to, without needing
/// their own try/catch just for toast purposes.
Future<bool> showAsyncToast(
  BuildContext context, {
  required Future<void> Function() task,
  required String loadingMessage,
  String successMessage = 'Done',
  Duration duration = const Duration(seconds: 2, milliseconds: 500),
}) async {
  final overlay = Overlay.of(context);
  final key = GlobalKey<_AsyncToastOverlayState>();
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => _AsyncToastOverlay(
      key: key,
      loadingMessage: loadingMessage,
      duration: duration,
      onDismissed: () => entry.remove(),
    ),
  );

  overlay.insert(entry);

  try {
    await task();
    key.currentState?.completeWith(message: successMessage, isSuccess: true);
    return true;
  } catch (e) {
    key.currentState?.completeWith(message: e.toString(), isSuccess: false);
    return false;
  }
}

class _ToastOverlay extends StatefulWidget {
  final String message;
  final bool isSuccess;
  final Duration duration;
  final VoidCallback onDismissed;

  const _ToastOverlay({
    required this.message,
    required this.isSuccess,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<_ToastOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      await _controller.reverse();
      widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topInset + kToolbarHeight,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: CloutToast(
                message: widget.message,
                isSuccess: widget.isSuccess,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AsyncToastOverlay extends StatefulWidget {
  final String loadingMessage;
  final Duration duration;
  final VoidCallback onDismissed;

  const _AsyncToastOverlay({
    super.key,
    required this.loadingMessage,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_AsyncToastOverlay> createState() => _AsyncToastOverlayState();
}

class _AsyncToastOverlayState extends State<_AsyncToastOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  bool _isLoading = true;
  bool _isSuccess = true;
  late String _message;

  @override
  void initState() {
    super.initState();
    _message = widget.loadingMessage;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
    // No auto-dismiss timer here — waits for completeWith() to be called.
  }

  /// Called externally once the wrapped task finishes — swaps the
  /// loading state for the final message, then starts the dismiss timer.
  void completeWith({required String message, required bool isSuccess}) {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _isSuccess = isSuccess;
      _message = message;
    });

    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      await _controller.reverse();
      widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topInset + kToolbarHeight,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: CloutToast(
                message: _message,
                isSuccess: _isSuccess,
                isLoading: _isLoading,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
