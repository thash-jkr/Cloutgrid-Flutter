import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../../../models/home/home_models.dart';

class FeedPost extends StatefulWidget {
  final PostModel post;
  final VoidCallback onLikeClick;
  final VoidCallback onCommentClick;
  final ValueChanged<String> onUserClick; // username
  final bool isOwner;
  final VoidCallback onBlockClick;
  final VoidCallback onDeleteClick;

  const FeedPost({
    super.key,
    required this.post,
    required this.onLikeClick,
    required this.onCommentClick,
    required this.onUserClick,
    this.isOwner = false,
    required this.onBlockClick,
    required this.onDeleteClick,
  });

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost>
    with SingleTickerProviderStateMixin {
  // AnimationController's value IS the scale factor directly (1.0-1.4),
  // via custom lowerBound/upperBound — avoids the usual 0.0-1.0 normalized
  // range + a separate Tween, since here the controller's raw value is
  // exactly what we want to feed into Transform.scale.
  late final AnimationController _scaleController = AnimationController(
    vsync: this,
    lowerBound: 1.0,
    upperBound: 1.4,
    value: 1.0,
  );

  /// Kotlin used `spring(dampingRatio = HighBouncy, stiffness = Low)` for
  /// the settle-back phase — Flutter has no direct dampingRatio/stiffness
  /// preset pair, so this SpringDescription approximates the same "quick
  /// overshoot then bouncy settle" feel. Tune `damping` lower for more
  /// bounce, higher for less, if it doesn't feel right on device.
  Future<void> _triggerBounce() async {
    _scaleController.value = 1.0;
    await _scaleController.animateTo(
      1.4,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    final spring = SpringDescription(mass: 1, stiffness: 200, damping: 6);
    final simulation = SpringSimulation(spring, 1.4, 1.0, 0);
    await _scaleController.animateWith(simulation);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _showBlockDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Block user?'),
        content: const Text('Are you sure you want to block this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onBlockClick();
            },
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Delete post?'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onDeleteClick();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showReportDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Report'),
        content: const Text(
          'Tell us why you want to report this. Our team will take appropriate action',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Reported')));
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0),
      color: theme.colorScheme.surface,
      shape:
          const RoundedRectangleBorder(), // RectangleShape — no rounded corners
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: avatar, name (+ collaborator), overflow menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    post.author.profilePhoto,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    // TODO: consider the cached_network_image package for
                    // Coil-equivalent disk caching — Image.network re-fetches
                    // on every rebuild without it.
                    errorBuilder: (context, error, stackTrace) =>
                        const CircleAvatar(radius: 15),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => widget.onUserClick(post.author.username),
                        child: Text(
                          post.author.name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      if (post.collaboration != null) ...[
                        const Text(
                          ' with ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () => widget.onUserClick(
                            post.collaboration!.profile.username,
                          ),
                          child: Text(
                            post.collaboration!.profile.name,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const Spacer(),
                _OverflowMenu(
                  isOwner: widget.isOwner,
                  post: post,
                  onDelete: _showDeleteDialog,
                  onReport: _showReportDialog,
                  onBlock: _showBlockDialog,
                ),
              ],
            ),
          ),

          // Post image with double-tap-to-like
          GestureDetector(
            onDoubleTap: () {
              _triggerBounce();
              if (!post.isLiked) widget.onLikeClick();
            },
            child: Image.network(
              post.image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Like / comment count row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (!post.isLiked) _triggerBounce();
                    widget.onLikeClick();
                  },
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, child) => Transform.scale(
                          scale: _scaleController.value,
                          child: child,
                        ),
                        child: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: post.isLiked
                              ? theme.colorScheme.secondary
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text: '${post.likeCount} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: 'Likes',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      ' · ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text: '${post.commentCount} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: 'Comments',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: widget.onCommentClick,
                  icon: const Icon(Icons.crop_square_rounded, size: 30),
                ),
              ],
            ),
          ),

          // Caption
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 8),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(height: 1.3),
                children: [
                  TextSpan(
                    text: '${post.author.username} ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: post.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Overflow ("...") menu — mirrors the Box + DropdownMenu pattern, but
/// using PopupMenuButton (same approach as CloutHeader's _ActionButton)
/// so there's no manual expanded/collapsed state to track.
class _OverflowMenu extends StatelessWidget {
  final bool isOwner;
  final PostModel post;
  final VoidCallback onDelete;
  final VoidCallback onReport;
  final VoidCallback onBlock;

  const _OverflowMenu({
    required this.isOwner,
    required this.post,
    required this.onDelete,
    required this.onReport,
    required this.onBlock,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VoidCallback>(
      icon: const Icon(Icons.more_horiz, color: Colors.black),
      color: Colors.white,
      onSelected: (action) => action(),
      itemBuilder: (context) {
        if (isOwner) {
          return [
            PopupMenuItem(
              value: onDelete,
              child: const Row(
                children: [
                  Icon(Icons.delete_outline, size: 20),
                  SizedBox(width: 12),
                  Text('Delete Post'),
                ],
              ),
            ),
          ];
        }

        return [
          PopupMenuItem(
            value: onReport,
            child: const Row(
              children: [
                Icon(Icons.report_outlined, size: 20),
                SizedBox(width: 12),
                Text('Report Post'),
              ],
            ),
          ),
          PopupMenuItem(
            value: onReport,
            child: Row(
              children: [
                const Icon(Icons.report_outlined, size: 20),
                const SizedBox(width: 12),
                Text('Report @${post.postedBy.profile.username}'),
              ],
            ),
          ),
          if (post.collaboration != null)
            PopupMenuItem(
              value: onReport,
              child: Row(
                children: [
                  const Icon(Icons.report_outlined, size: 20),
                  const SizedBox(width: 12),
                  Text('Report @${post.collaboration!.profile.username}'),
                ],
              ),
            ),
          PopupMenuItem(
            value: onBlock,
            child: Row(
              children: [
                const Icon(Icons.block, size: 20),
                const SizedBox(width: 12),
                Text('Block @${post.postedBy.profile.username}'),
              ],
            ),
          ),
        ];
      },
    );
  }
}
