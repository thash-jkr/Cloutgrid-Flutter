import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/auth/auth_models.dart';
import '../../models/home/home_models.dart';
import '../home/home_notifier.dart';
import '../profile/profile_notifier.dart';

part 'create_notifier.g.dart';

class CreateState {
  final List<UserContainer> collabs;
  final bool isLoading;
  final String? errorMessage;

  const CreateState({
    this.collabs = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  CreateState copyWith({
    List<UserContainer>? collabs,
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
          .request<List<UserContainer>>(
            '/search-business?q=$query',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => UserContainer.fromJson(e as Map<String, dynamic>))
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
    String? collab,
  }) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final newPost = await ref
          .read(apiServiceProvider)
          .multipartRequest<PostModel>(
            '/posts/',
            method: 'POST',
            fromJson: (json) => PostModel.fromJson(json),
            imageBytes: imageBytes,
            imageKey: 'image',
            params: {'caption': caption, 'collaboration': collab ?? 'null'},
            requireAuth: true,
          );

      // Keep Home's feed and Profile's own post grid in sync with the
      // newly created post — same cross-notifier sync pattern used for
      // likePost earlier.
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
