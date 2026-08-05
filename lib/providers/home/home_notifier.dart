import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/home/home_models.dart';

part 'home_notifier.g.dart';

class HomeState {
  final List<NotificationModel> notifications;
  final List<PostModel> posts;
  final List<CommentModel> comments;
  final String? nextCursor;
  final bool isLoading;

  const HomeState({
    this.notifications = const [],
    this.posts = const [],
    this.comments = const [],
    this.nextCursor,
    this.isLoading = false,
  });

  HomeState copyWith({
    List<NotificationModel>? notifications,
    List<PostModel>? posts,
    List<CommentModel>? comments,
    String? nextCursor,
    bool clearNextCursor = false,
    bool? isLoading,
  }) {
    return HomeState(
      notifications: notifications ?? this.notifications,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      nextCursor: clearNextCursor ? null : (nextCursor ?? this.nextCursor),
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  Future<void> fetchNotifications() async {
    final results = await ref
        .read(apiServiceProvider)
        .request<List<NotificationModel>>(
          '/notifications/?all=false/',
          method: 'GET',
          fromJson: (json) => (json as List)
              .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          requireAuth: true,
        );

    state = state.copyWith(notifications: results);
  }

  Future<void> readNotification(int id) async {
    await ref
        .read(apiServiceProvider)
        .request<dynamic>(
          '/notifications/$id/mark_as_read/',
          method: 'POST',
          fromJson: (json) => json,
          requireAuth: true,
        );

    state = state.copyWith(
      notifications: state.notifications.where((n) => n.id != id).toList(),
    );
  }

  Future<void> fetchPosts({required bool isFirstPage}) async {
    final url = isFirstPage ? '/posts/' : state.nextCursor;
    if (url == null || url.isEmpty) return;

    state = state.copyWith(isLoading: true);
    try {
      final response = await ref
          .read(apiServiceProvider)
          .request<PostResponse>(
            url,
            method: 'GET',
            fromJson: (json) => PostResponse.fromJson(json),
            requireAuth: true,
            fullUrl: !isFirstPage,
          );

      final updatedPosts = isFirstPage
          ? response.results
          : [...state.posts, ...response.results];

      state = state.copyWith(
        posts: updatedPosts,
        nextCursor: response.next,
        clearNextCursor: response.next == null,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  void addNewPost(PostModel post) {
    state = state.copyWith(posts: [post, ...state.posts]);
  }

  Future<LikeResponse> likePost(int postId) async {
    final response = await ref
        .read(apiServiceProvider)
        .request<LikeResponse>(
          '/posts/$postId/like/',
          method: 'POST',
          fromJson: (json) => LikeResponse.fromJson(json),
          body: <String, String>{},
          requireAuth: true,
        );

    state = state.copyWith(
      posts: state.posts.map((p) {
        if (p.id != postId) return p;
        return p.copyWith(
          isLiked: response.liked,
          likeCount: response.likeCount,
        );
      }).toList(),
    );

    return response;
  }

  Future<void> deletePost(int postId) async {
    await ref
        .read(apiServiceProvider)
        .request<dynamic>(
          '/posts/$postId/',
          method: 'DELETE',
          fromJson: (json) => json,
          requireAuth: true,
        );

    state = state.copyWith(
      posts: state.posts.where((p) => p.id != postId).toList(),
    );
  }

  Future<void> fetchComments(int postId) async {
    state = state.copyWith(comments: [], isLoading: true);
    final results = await ref
        .read(apiServiceProvider)
        .request<List<CommentModel>>(
          '/posts/$postId/comments/',
          method: 'GET',
          fromJson: (json) => (json as List)
              .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          requireAuth: true,
        );

    state = state.copyWith(comments: results, isLoading: false);
  }

  Future<void> addComment(int postId, String content) async {
    final comment = await ref
        .read(apiServiceProvider)
        .request<CommentModel>(
          '/posts/$postId/comments/',
          method: 'POST',
          fromJson: (json) => CommentModel.fromJson(json),
          body: {'content': content},
          requireAuth: true,
        );

    state = state.copyWith(comments: [comment, ...state.comments]);
    state = state.copyWith(
      posts: state.posts.map((p) {
        if (p.id != postId) return p;
        return p.copyWith(commentCount: p.commentCount + 1);
      }).toList(),
    );
  }

  Future<void> deleteComment(int postId, int commentId) async {
    await ref
        .read(apiServiceProvider)
        .request<dynamic>(
          '/posts/$postId/comment/$commentId/',
          method: 'DELETE',
          fromJson: (json) => json,
          requireAuth: true,
        );

    state = state.copyWith(
      comments: state.comments.where((c) => c.id != commentId).toList(),
    );
    state = state.copyWith(
      posts: state.posts.map((p) {
        if (p.id != postId) return p;
        return p.copyWith(commentCount: p.commentCount - 1);
      }).toList(),
    );
  }

  // NOTE: your Kotlin call site passes a second bool arg
  // (home.handleBlock(username, true)) that wasn't in the HomeRepository
  // source you shared earlier — likely a "also notify the server" flag
  // added at the HomeManager level. Left as a single-arg local-only
  // removal for now; tell me what that bool controls and I'll wire the
  // matching API call.
  void handleBlock(String username) {
    state = state.copyWith(
      posts: state.posts
          .where((p) => p.postedBy.profile.username != username)
          .toList(),
    );
  }
}
