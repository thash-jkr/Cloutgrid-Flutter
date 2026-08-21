import 'package:cloutgrid_flutter/presentation/home/comments.dart';
import 'package:cloutgrid_flutter/presentation/home/feed_loading.dart';
import 'package:cloutgrid_flutter/presentation/home/feed_post.dart';
import 'package:cloutgrid_flutter/presentation/home/notifications.dart';
import 'package:cloutgrid_flutter/presentation/tab_navigator.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../providers/home/home_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final ValueChanged<TabItem> onSelectTab;
  final void Function(UserContainer user) onNavigateToOtherProfile;
  final void Function() onNavigateToConversations;

  const HomeScreen({
    super.key,
    required this.onSelectTab,
    required this.onNavigateToOtherProfile,
    required this.onNavigateToConversations,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();
  int? _selectedPostId;

  @override
  void initState() {
    super.initState();

    Future(() {
      final home = ref.read(homeProvider.notifier);

      if (ref.read(homeProvider).posts.isEmpty) {
        home.fetchPosts(isFirstPage: true);
      }
      if (ref.read(homeProvider).notifications.isEmpty) {
        home.fetchNotifications();
      }
    });

    _scrollController.addListener(() {
      final home = ref.read(homeProvider.notifier);
      final state = ref.read(homeProvider);
      final nearBottom =
          _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300;

      if (nearBottom && !state.isLoading && state.nextCursor != null) {
        home.fetchPosts(isFirstPage: false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final home = ref.read(homeProvider.notifier);
    await Future.wait([
      home.fetchPosts(isFirstPage: true),
      home.fetchNotifications(),
    ]);
  }

  void _openNotifications() {
    cloutSheet(
      context,
      content: (context, scrollController) =>
          Notifications(scrollController: scrollController),
    );
  }

  void _openComments(int postId) {
    if (_selectedPostId != null) return;
    _selectedPostId = postId;

    ref.read(homeProvider.notifier).fetchComments(postId);

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
                ref.read(homeProvider.notifier).addComment(postId, content),
            onDeleteComment: (commentId) => ref
                .read(homeProvider.notifier)
                .deleteComment(postId, commentId),
            scrollController: scrollController,
          );
        },
      ),
    ).whenComplete(() {
      _selectedPostId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeState = ref.watch(homeProvider);
    final authState = ref.watch(authProvider);

    final UserContainer? user = authState.value?.user;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        icon: HeaderAction(
          image: const AssetImage('assets/images/cloutgrid_logo.png'),
          contentDescription: "Cloutgrid",
          onClick: () {},
        ),
        actions: [
          HeaderAction(
            icon: Icons.notifications_none_rounded,
            contentDescription: "Notifications",
            onClick: _openNotifications,
          ),
          HeaderAction(
            icon: Icons.messenger_outline_rounded,
            contentDescription: "Chats",
            onClick: widget.onNavigateToConversations,
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: (homeState.posts.isEmpty && homeState.isLoading)
              ? const FeedLoading()
              : homeState.posts.isEmpty
              ? CloutEmpty(type: .post, message: "No new posts!")
              : ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    top: kToolbarHeight + MediaQuery.of(context).padding.top,
                    bottom: 100,
                  ),
                  itemCount:
                      homeState.posts.length +
                      (homeState.posts.isNotEmpty && homeState.isLoading
                          ? 1
                          : 0),
                  itemBuilder: (context, index) {
                    if (index >= homeState.posts.length) {
                      // Trailing loading indicator while paginating.
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                      );
                    }

                    final post = homeState.posts[index];
                    final isOwner =
                        post.postedBy.profile.username ==
                        user?.profile.username;

                    return FeedPost(
                      key: ValueKey(post.id),
                      post: post,
                      onLikeClick: () =>
                          ref.read(homeProvider.notifier).likePost(post.id),
                      onCommentClick: () => _openComments(post.id),
                      onUserClick: (username) {
                        if (username == user?.profile.username) {
                          widget.onSelectTab(.profile);
                        } else {
                          widget.onNavigateToOtherProfile(post.postedBy);
                        }
                      },
                      onBlockClick: () => ref
                          .read(homeProvider.notifier)
                          .handleBlock(post.postedBy.profile.username),
                      isOwner: isOwner,
                      onDeleteClick: () =>
                          ref.read(homeProvider.notifier).deletePost(post.id),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
