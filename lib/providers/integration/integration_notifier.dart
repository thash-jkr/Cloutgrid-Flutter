import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/integration/integration_models.dart';
import '../auth/auth_notifier.dart';

part 'integration_notifier.g.dart';

class IntegrationState {
  final InstagramPageModel? instagramPage;
  final List<InstagramMediaModel> instagramMedia;
  final YoutubeChannelModel? youtubeChannel;
  final List<YoutubeMediaModel> youtubeMedia;

  final InstagramPageModel? otherInstagramPage;
  final List<InstagramMediaModel> otherInstagramMedia;
  final YoutubeChannelModel? otherYoutubeChannel;
  final List<YoutubeMediaModel> otherYoutubeMedia;

  final bool isLoading;
  final String? errorMessage;

  const IntegrationState({
    this.instagramPage,
    this.instagramMedia = const [],
    this.youtubeChannel,
    this.youtubeMedia = const [],
    this.otherInstagramPage,
    this.otherInstagramMedia = const [],
    this.otherYoutubeChannel,
    this.otherYoutubeMedia = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  IntegrationState copyWith({
    InstagramPageModel? instagramPage,
    bool clearInstagramPage = false,
    List<InstagramMediaModel>? instagramMedia,
    YoutubeChannelModel? youtubeChannel,
    bool clearYoutubeChannel = false,
    List<YoutubeMediaModel>? youtubeMedia,
    InstagramPageModel? otherInstagramPage,
    bool clearOtherInstagramPage = false,
    List<InstagramMediaModel>? otherInstagramMedia,
    YoutubeChannelModel? otherYoutubeChannel,
    bool clearOtherYoutubeChannel = false,
    List<YoutubeMediaModel>? otherYoutubeMedia,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return IntegrationState(
      instagramPage: clearInstagramPage
          ? null
          : (instagramPage ?? this.instagramPage),
      instagramMedia: instagramMedia ?? this.instagramMedia,
      youtubeChannel: clearYoutubeChannel
          ? null
          : (youtubeChannel ?? this.youtubeChannel),
      youtubeMedia: youtubeMedia ?? this.youtubeMedia,
      otherInstagramPage: clearOtherInstagramPage
          ? null
          : (otherInstagramPage ?? this.otherInstagramPage),
      otherInstagramMedia: otherInstagramMedia ?? this.otherInstagramMedia,
      otherYoutubeChannel: clearOtherYoutubeChannel
          ? null
          : (otherYoutubeChannel ?? this.otherYoutubeChannel),
      otherYoutubeMedia: otherYoutubeMedia ?? this.otherYoutubeMedia,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}

@Riverpod(keepAlive: true)
class IntegrationNotifier extends _$IntegrationNotifier {
  @override
  IntegrationState build() => const IntegrationState();

  Future<String> connectInstagram() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final response = await ref
          .read(apiServiceProvider)
          .request<InstagramResponseModel>(
            '/instagram/connect/',
            method: 'POST',
            fromJson: (json) => InstagramResponseModel.fromJson(json),
            body: <String, String>{},
            requireAuth: true,
          );

      await ref.read(authProvider.notifier).setInstagramConnected(true);
      state = state.copyWith(isLoading: false);
      return '@${response.igPage} connected';
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<void> disconnectInstagram() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref.read(authProvider.notifier).setInstagramConnected(false);
      state = state.copyWith(
        clearInstagramPage: true,
        instagramMedia: const [],
      );

      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/auth/instagram/disconnect/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<void> purgeInstagram() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref.read(authProvider.notifier).setInstagramConnected(false);
      state = state.copyWith(
        clearInstagramPage: true,
        instagramMedia: const [],
      );

      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/auth/instagram/purge/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<void> fetchInstagramProfile() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/instagram/profile/fetch/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<InstagramPageModel> _readInstagramProfile(String username) async {
    final response = await ref
        .read(apiServiceProvider)
        .request<InstagramPageResponse>(
          '/instagram/profile/read/$username/',
          method: 'GET',
          fromJson: (json) => InstagramPageResponse.fromJson(json),
          requireAuth: true,
        );
    return response.profileData;
  }

  Future<void> loadOwnInstagramProfile(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final page = await _readInstagramProfile(username);
      state = state.copyWith(instagramPage: page, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> readOtherInstagramProfile(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final page = await _readInstagramProfile(username);
      state = state.copyWith(otherInstagramPage: page, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchInstagramMedia() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/instagram/media/fetch/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<List<InstagramMediaModel>> _readInstagramMedia(String username) async {
    final response = await ref
        .read(apiServiceProvider)
        .request<InstagramMediaResponse>(
          '/instagram/media/read/$username/',
          method: 'GET',
          fromJson: (json) => InstagramMediaResponse.fromJson(json),
          requireAuth: true,
        );
    return response.media;
  }

  Future<void> loadOwnInstagramMedia(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final media = await _readInstagramMedia(username);
      state = state.copyWith(instagramMedia: media, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> readOtherInstagramMedia(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final media = await _readInstagramMedia(username);
      state = state.copyWith(otherInstagramMedia: media, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchYoutubeChannel() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/youtube/channel/fetch/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<YoutubeChannelModel> _readYoutubeChannel(String username) async {
    final response = await ref
        .read(apiServiceProvider)
        .request<YoutubeChannelResponse>(
          '/youtube/channel/read/$username/',
          method: 'GET',
          fromJson: (json) => YoutubeChannelResponse.fromJson(json),
          requireAuth: true,
        );
    return response.channelData;
  }

  Future<void> loadOwnYoutubeChannel(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final channel = await _readYoutubeChannel(username);
      state = state.copyWith(youtubeChannel: channel, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> readOtherYoutubeChannel(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final channel = await _readYoutubeChannel(username);
      state = state.copyWith(otherYoutubeChannel: channel, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchYoutubeMedia() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/youtube/media/fetch/',
            method: 'POST',
            fromJson: (json) => json,
            body: <String, String>{},
            requireAuth: true,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  Future<List<YoutubeMediaModel>> _readYoutubeMedia(String username) async {
    final response = await ref
        .read(apiServiceProvider)
        .request<YoutubeMediaResponse>(
          '/youtube/media/read/$username/',
          method: 'GET',
          fromJson: (json) => YoutubeMediaResponse.fromJson(json),
          requireAuth: true,
        );
    return response.data;
  }

  Future<void> loadOwnYoutubeMedia(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final media = await _readYoutubeMedia(username);
      state = state.copyWith(youtubeMedia: media, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> readOtherYoutubeMedia(String username) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);
    try {
      final media = await _readYoutubeMedia(username);
      state = state.copyWith(otherYoutubeMedia: media, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
