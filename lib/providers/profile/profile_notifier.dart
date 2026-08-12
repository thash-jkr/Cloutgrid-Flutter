import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:cloutgrid_flutter/providers/home/home_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/home/home_models.dart';
import '../../models/auth/auth_models.dart';

part 'profile_notifier.g.dart';

class ProfileState {
  final List<PostModel> posts;
  final List<PostModel> collabs;
  final List<PostModel> otherPosts;
  final List<PostModel> otherCollabs;
  final UserContainer? otherProfile;
  final bool profile;
  final bool isLoading;
  final String? errorMessage;

  const ProfileState({
    this.posts = const [],
    this.collabs = const [],
    this.otherPosts = const [],
    this.otherCollabs = const [],
    this.otherProfile,
    this.profile = false,
    this.isLoading = false,
    this.errorMessage,
  });

  ProfileState copyWith({
    List<PostModel>? posts,
    List<PostModel>? collabs,
    List<PostModel>? otherPosts,
    List<PostModel>? otherCollabs,
    UserContainer? otherProfile,
    bool clearOtherProfile = false,
    bool? profile,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return ProfileState(
      posts: posts ?? this.posts,
      collabs: collabs ?? this.collabs,
      otherPosts: otherPosts ?? this.otherPosts,
      otherCollabs: otherCollabs ?? this.otherCollabs,
      otherProfile: clearOtherProfile
          ? null
          : (otherProfile ?? this.otherProfile),
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build() => const ProfileState();

  Future<void> fetchProfile(String username, {required bool other}) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final result = await ref
          .read(apiServiceProvider)
          .request<UserContainer>(
            '/profiles/$username/',
            method: 'GET',
            fromJson: (json) =>
                UserContainer.fromJson(json as Map<String, dynamic>),
            requireAuth: true,
          );

      if (other) {
        state = state.copyWith(otherProfile: result);
      } else {
        await ref.read(authProvider.notifier).saveUser(result);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchPosts(String username, {bool other = false}) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<PostModel>>(
            '/posts/$username/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      if (other) {
        state = state.copyWith(otherPosts: results);
      } else {
        state = state.copyWith(posts: results, profile: true);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchCollabs(String username, {bool other = false}) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    final endpoint = other ? '/posts/collabs/$username/' : '/posts/collabs/';

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<PostModel>>(
            endpoint,
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      if (other) {
        state = state.copyWith(otherCollabs: results);
      } else {
        state = state.copyWith(collabs: results);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> handleBlock(String username, bool block) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    final action = block ? 'block' : 'unblock';

    try {
      await ref
          .read(apiServiceProvider)
          .request<EmptyResponse>(
            '/profiles/$username/$action/',
            method: 'POST',
            fromJson: (json) => EmptyResponse.fromJson(json),
            requireAuth: true,
          );

      final current = state.otherProfile;
      if (current != null) {
        state = state.copyWith(
          otherProfile: current.copyWith(isBlocking: block),
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> handleFollow(String username, bool follow) async {
    state = state.copyWith(clearErrorMessage: true);
    final action = follow ? 'follow' : 'unfollow';

    try {
      await ref
          .read(apiServiceProvider)
          .request<EmptyResponse>(
            '/profiles/$username/$action/',
            method: 'POST',
            fromJson: (json) => EmptyResponse.fromJson(json),
            requireAuth: true,
          );

      final current = state.otherProfile;
      if (current != null) {
        final updatedCount = current.profile.followersCount + (follow ? 1 : -1);
        state = state.copyWith(
          otherProfile: current.copyWith(
            isFollowing: follow,
            profile: current.profile.copyWith(followersCount: updatedCount),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> likePost(int postId) async {
    try {
      final response = await ref.read(homeProvider.notifier).likePost(postId);

      PostModel updateIfMatch(PostModel p) => p.id == postId
          ? p.copyWith(likeCount: response.likeCount, isLiked: response.liked)
          : p;

      state = state.copyWith(
        posts: state.posts.map(updateIfMatch).toList(),
        collabs: state.collabs.map(updateIfMatch).toList(),
        otherPosts: state.otherPosts.map(updateIfMatch).toList(),
        otherCollabs: state.otherCollabs.map(updateIfMatch).toList(),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void removePost(int postId) {
    state = state.copyWith(
      posts: state.posts.where((p) => p.id != postId).toList(),
    );
  }

  void addNewPost(PostModel post) {
    state = state.copyWith(posts: [post, ...state.posts]);
  }
}
