import 'dart:typed_data';

import 'package:cloutgrid_flutter/app/network/api_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers/core_providers.dart';
import '../../models/auth/auth_models.dart';
import '../../models/home/home_models.dart';
import '../home/home_notifier.dart';
import '../profile/profile_notifier.dart';

part 'create_notifier.g.dart';

class CreateState {
  final List<UserProfile> collabs;
  final bool isLoading;
  final String? errorMessage;

  const CreateState({
    this.collabs = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  CreateState copyWith({
    List<UserProfile>? collabs,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return CreateState(
      collabs: collabs ?? this.collabs,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}

@Riverpod(keepAlive: true)
class CreateNotifier extends _$CreateNotifier {
  @override
  CreateState build() => const CreateState();

  Future<void> searchBusiness(String query) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<UserProfile>>(
            '/search-business?q=$query',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(collabs: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<bool> handlePostImage({
    required Uint8List imageBytes,
    required String caption,
    required String aspect,
    String? collab,
  }) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      PostModel newPost = await ref
          .read(apiServiceProvider)
          .multipartRequest<PostModel>(
            '/posts/',
            method: 'POST',
            fromJson: (json) => PostModel.fromJson(json),
            imageBytes: imageBytes,
            imageKey: 'image',
            params: {
              'caption': caption,
              'aspect': aspect,
              'collaboration': collab ?? 'null',
            },
            requireAuth: true,
          );

      newPost = newPost.copyWith(
        image: ApiConfig.current.baseUrl + newPost.image,
      );

      ref.read(homeProvider.notifier).addNewPost(newPost);
      ref.read(profileProvider.notifier).addNewPost(newPost);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      return false;
    }
  }
}
