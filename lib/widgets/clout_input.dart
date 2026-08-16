import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CloutInput extends StatefulWidget {
  final ValueChanged<String> onSend;
  final String? avatarUrl;
  final String hintText;
  final int maxLines;

  const CloutInput({
    super.key,
    required this.onSend,
    this.avatarUrl,
    this.hintText = 'Write something...',
    this.maxLines = 5,
  });

  @override
  State<CloutInput> createState() => _CloutInputState();
}

class _CloutInputState extends State<CloutInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: _controller,
      maxLines: widget.maxLines,
      minLines: 1,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: widget.avatarUrl != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.avatarUrl!,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircleAvatar(radius: 15),
                    errorWidget: (context, url, error) =>
                        const CircleAvatar(radius: 15),
                  ),
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 50,
          minHeight: 30,
        ),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, child) {
            final hasText = value.text.trim().isNotEmpty;
            return IconButton(
              onPressed: hasText ? _handleSend : null,
              icon: Icon(
                Icons.send_rounded,
                color: hasText
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            );
          },
        ),
      ),
    );
  }
}
