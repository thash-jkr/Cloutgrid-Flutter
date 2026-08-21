import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/home/comments.dart';
import 'package:cloutgrid_flutter/presentation/home/feed_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/home/home_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/home/home_notifier.dart';
import '../../providers/profile/profile_notifier.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_sheet.dart';

class PostDetail extends ConsumerWidget {
  final int id;
  final bool other;
  final VoidCallback onNavigateBack;

  const PostDetail({
    super.key,
    required this.id,
    required this.other,
    required this.onNavigateBack,
  });

  PostModel? _findById(List<PostModel> list, int id) {
    for (final p in list) {
      if (p.id == id) return p;
    }
    return null;
  }

  void _openComments(BuildContext context, WidgetRef ref) {
    ref.read(homeProvider.notifier).fetchComments(id);

    cloutSheet(
      context,
      content: (context, scrollController) => Consumer(
        builder: (context, ref, _) {
          final homeState = ref.watch(homeProvider);
          final user = ref.watch(authProvider).value?.user;

          return Comments(
            comments: homeState.comments,
            isLoading: homeState.isLoading,
            user: user,
            onAddComment: (content) =>
                ref.read(homeProvider.notifier).addComment(id, content),
            onDeleteComment: (commentId) =>
                ref.read(homeProvider.notifier).deleteComment(id, commentId),
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInset = MediaQuery.of(context).padding.top;
    final profileState = ref.watch(profileProvider);

    final post = other
        ? (_findById(profileState.otherPosts, id) ??
              _findById(profileState.otherCollabs, id))
        : (_findById(profileState.posts, id) ??
              _findById(profileState.collabs, id));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Post Detail',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: onNavigateBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: kToolbarHeight + topInset, bottom: 100),
        child: post == null
            ? Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: profileState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Post not found'),
                ),
              )
            : FeedPost(
                key: ValueKey(post.id),
                post: post,
                // Routed through HomeNotifier — it already owns the real
                // like/comment logic; ProfileNotifier doesn't duplicate it.
                onLikeClick: () =>
                    ref.read(profileProvider.notifier).likePost(post.id),
                onCommentClick: () => _openComments(context, ref),
                onUserClick: (username) {},
                isOwner: !other,
                onBlockClick: () {
                  if (other) {
                    ref
                        .read(profileProvider.notifier)
                        .handleBlock(post.postedBy.profile.username, true);
                    onNavigateBack();
                  }
                },
                onDeleteClick: () {
                  if (!other) {
                    ref.read(homeProvider.notifier).deletePost(post.id);
                    ref.read(profileProvider.notifier).removePost(post.id);
                    onNavigateBack();
                  }
                },
              ),
      ),
    );
  }
}
