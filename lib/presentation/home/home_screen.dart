import 'package:cloutgrid_flutter/presentation/home/feed_post.dart';
import 'package:cloutgrid_flutter/widgets/feed_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../providers/home/home_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();
  // int? _selectedPostId;

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

  // void _openNotifications() {
  //   showCloutSheet(context, content: (context) => const Notifications());
  // }

  // void _openComments(int postId) {
  //   ref.read(homeProvider.notifier).fetchComments(postId);
  //   setState(() => _selectedPostId = postId);

  //   showCloutSheet(
  //     context,
  //     content: (context) => Consumer(
  //       builder: (context, ref, _) {
  //         final homeState = ref.watch(homeNotifierProvider);
  //         final authState = ref.watch(authProvider);
  //         final user = authState.value?.user;

  //         return Comments(
  //           comments: homeState.comments,
  //           isLoading: homeState.isLoading,
  //           user: user,
  //           onAddComment: (content) => ref
  //               .read(homeNotifierProvider.notifier)
  //               .addComment(postId, content),
  //           onDeleteComment: (commentId) => ref
  //               .read(homeNotifierProvider.notifier)
  //               .deleteComment(postId, commentId),
  //         );
  //       },
  //     ),
  //   ).whenComplete(() => setState(() => _selectedPostId = null));
  // }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final authState = ref.watch(authProvider);
    final UserContainer? user = authState.value?.user;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        icon: HeaderAction(
          icon: Icons.rocket_rounded,
          contentDescription: "Cloutgrid",
        ),
        actions: [
          HeaderAction(
            icon: Icons.notifications_none_rounded,
            contentDescription: "Notifications",
            onClick: () {}, // _openNotifications,
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
              : ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    top: kToolbarHeight + MediaQuery.of(context).padding.top,
                    bottom:
                        100, // clears TabNavigator's floating pill bar (~70 height + margin)
                  ),
                  itemCount:
                      homeState.posts.length +
                      (homeState.posts.isNotEmpty && homeState.isLoading
                          ? 1
                          : 0),
                  itemBuilder: (context, index) {
                    if (index >= homeState.posts.length) {
                      // Trailing loading indicator while paginating.
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(child: CircularProgressIndicator()),
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
                      onCommentClick: () {}, //() => _openComments(post.id),
                      onUserClick: (username) {
                        if (username == user?.profile.username) {
                          // TODO: onSelectTab(TabItem.profile) equivalent —
                          // wire once TabNavigator exposes a page-select
                          // callback down to HomeScreen.
                        } else {
                          // TODO: onNavigateToOtherProfile(username)
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
