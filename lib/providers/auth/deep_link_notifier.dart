import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deep_link_notifier.g.dart';

enum ProfileAction { connectInstagram, connectYoutube }

class DeepLinkState {
  final ProfileAction? profileAction;

  const DeepLinkState({this.profileAction});

  DeepLinkState copyWith({
    bool clearTargetTab = false,
    ProfileAction? profileAction,
    bool clearProfileAction = false,
  }) {
    return DeepLinkState(
      profileAction: clearProfileAction
          ? null
          : (profileAction ?? this.profileAction),
    );
  }
}

@Riverpod(keepAlive: true)
class DeepLinkNotifier extends _$DeepLinkNotifier {
  @override
  DeepLinkState build() => const DeepLinkState();

  void handleUri(Uri uri) {
    if (uri.scheme != 'cloutgrid') return;

    if (uri.host == 'profile') {
      final instagramStatus = uri.queryParameters['instagram'];
      if (instagramStatus == 'connected') {
        state = state.copyWith(profileAction: ProfileAction.connectInstagram);
        return;
      }

      final youtubeStatus = uri.queryParameters['youtube'];
      if (youtubeStatus == 'connected') {
        state = state.copyWith(profileAction: ProfileAction.connectYoutube);
        return;
      }
    }
  }

  void clearTargetTab() {
    state = state.copyWith(clearTargetTab: true);
  }

  void clearProfileAction() {
    state = state.copyWith(clearProfileAction: true);
  }
}
