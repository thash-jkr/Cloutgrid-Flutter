import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/gestures.dart';

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
  late final AnimationController _scaleController = AnimationController(
    vsync: this,
    lowerBound: 1.0,
    upperBound: 1.4,
    value: 1.0,
  );

  double getAspect(PostModel post) {
    switch (post.aspect) {
      case "1:1":
        return 1;
      case "4:3":
        return 1.334;
      case "3:4":
        return 0.75;
      default:
        return 1;
    }
  }

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

  TapGestureRecognizer? _collabTapRecognizer;

  @override
  void dispose() {
    _scaleController.dispose();
    _collabTapRecognizer?.dispose();
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: post.author.profilePhoto,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircleAvatar(radius: 15),
                    errorWidget: (context, url, error) =>
                        const CircleAvatar(radius: 15),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  post.author.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
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

          GestureDetector(
            onDoubleTap: () {
              _triggerBounce();
              if (!post.isLiked) widget.onLikeClick();
            },
            child: CachedNetworkImage(
              imageUrl: post.image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => AspectRatio(
                aspectRatio: getAspect(post),
                child: Container(color: Colors.grey.shade200),
              ),
              errorWidget: (context, url, error) => AspectRatio(
                aspectRatio: getAspect(post),
                child: Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image_outlined),
                ),
              ),
            ),
          ),

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

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 8),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(height: 1.3, color: Colors.black),
                children: [
                  TextSpan(
                    text: post.author.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (post.collaboration != null) ...[
                    const TextSpan(
                      text: ' collaborating with ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: post.collaboration!.profile.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: _collabTapRecognizer = TapGestureRecognizer()
                        ..onTap = () => widget.onUserClick(
                          post.collaboration!.profile.username,
                        ),
                    ),
                  ],
                  const TextSpan(
                    text: '\n',
                  ), // forces the caption onto its own line
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
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      offset: const Offset(0, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      clipBehavior: Clip.antiAlias,
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
