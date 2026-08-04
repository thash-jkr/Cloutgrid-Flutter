import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum EmptyType {
  post('assets/images/photo.png'),
  collab('assets/images/office.png'),
  comment('assets/images/complaint.png'),
  instagram('assets/images/instagram_insight.png'),
  youtube('assets/images/youtube_analytics.png'),
  chat('assets/images/chat.png'),
  general('assets/images/box.png');

  final String assetPath;
  const EmptyType(this.assetPath);
}

class CloutEmpty extends StatelessWidget {
  final EmptyType type;
  final String message;
  final bool isLoading;

  const CloutEmpty({
    super.key,
    required this.type,
    required this.message,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            type.assetPath,
            width: 150,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 150, height: 150),
          ),
          const SizedBox(height: 10),
          if (isLoading)
            LoadingAnimationWidget.threeArchedCircle(
              color: theme.colorScheme.secondary,
              size: 25,
            )
          else
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
