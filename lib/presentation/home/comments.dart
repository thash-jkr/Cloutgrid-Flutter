import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_config.dart';
import '../../../models/auth/auth_models.dart';
import '../../../models/home/home_models.dart';
import '../../../widgets/clout_header.dart';

class Comments extends StatefulWidget {
  final List<CommentModel> comments;
  final bool isLoading;
  final UserContainer? user;
  final ValueChanged<String> onAddComment;
  final ValueChanged<int> onDeleteComment;
  final ScrollController? scrollController;

  const Comments({
    super.key,
    required this.comments,
    required this.isLoading,
    required this.user,
    required this.onAddComment,
    required this.onDeleteComment,
    this.scrollController,
  });

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final _commentController = TextEditingController();
  final TextEditingController _reportField = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    widget.onAddComment(text);
    _commentController.clear();
  }

  void _showReportDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Report Content'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tell us why you want to report this comment. Our team will take appropriate action',
            ),

            TextField(
              controller: _reportField,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Write your complaint here",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Comments'),
      body: Stack(
        children: [
          // Comment list
          if (widget.comments.isNotEmpty)
            ListView.builder(
              controller: widget.scrollController,
              padding: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 150),
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                final comment = widget.comments[index];
                return _CommentRow(
                  comment: comment,
                  user: widget.user,
                  onDelete: () => widget.onDeleteComment(comment.id),
                  onReport: _showReportDialog,
                );
              },
            )
          else
            CloutEmpty(
              type: .comment,
              message: "No comments yet!",
              isLoading: widget.isLoading,
            ),

          // Floating input bar at bottom
          Positioned(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? 15
                : MediaQuery.of(context).padding.bottom,
            child: _CommentInputBar(
              user: widget.user,
              controller: _commentController,
              onSend: _handleSend,
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentRow extends StatelessWidget {
  final CommentModel comment;
  final UserContainer? user;
  final VoidCallback onDelete;
  final VoidCallback onReport;

  const _CommentRow({
    required this.comment,
    required this.user,
    required this.onDelete,
    required this.onReport,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOwner =
        user != null && comment.user.username == user!.profile.username;
    final offWhite = theme.colorScheme.surface;
    final photoUrl = ApiConfig.current.baseUrl + comment.user.profilePhoto;

    return Dismissible(
      key: ValueKey(comment.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        if (isOwner) {
          onDelete();
          return true;
        } else {
          onReport();
          return false; // snaps back, same as dismissState.reset()
        }
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(isOwner ? Icons.delete : Icons.flag, color: Colors.white),
      ),
      child: Column(
        children: [
          ListTile(
            tileColor: offWhite,
            leading: ClipOval(
              child: CachedNetworkImage(
                imageUrl: photoUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircleAvatar(radius: 20),
                errorWidget: (context, url, error) =>
                    const CircleAvatar(radius: 20),
              ),
            ),
            title: Text(comment.content),
            subtitle: Text(
              '${comment.user.username} • ${timeAgo(comment.commentedAt)}',
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ],
      ),
    );
  }
}

class _CommentInputBar extends StatelessWidget {
  final UserContainer? user;
  final TextEditingController controller;
  final VoidCallback onSend;

  const _CommentInputBar({
    required this.user,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photoUrl = user != null
        ? ApiConfig.current.baseUrl + user!.profile.profilePhoto
        : null;

    return TextField(
      controller: controller,
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
        hintText: 'Write something...',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: photoUrl != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: photoUrl,
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
          valueListenable: controller,
          builder: (context, value, child) {
            final hasText = value.text.trim().isNotEmpty;
            return IconButton(
              onPressed: hasText ? onSend : null,
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
