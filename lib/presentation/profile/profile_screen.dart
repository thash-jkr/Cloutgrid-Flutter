import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_header.dart';
import 'package:cloutgrid_flutter/presentation/profile/rate_card.dart';
import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:cloutgrid_flutter/providers/auth/deep_link_notifier.dart';
import 'package:cloutgrid_flutter/providers/integration/integration_notifier.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final VoidCallback onNavigateToSettings;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final VoidCallback onNavigateToEditProfile;
  final VoidCallback onNavigateToInstagram;
  final VoidCallback onNavigateToYouTube;
  final void Function(
    String title,
    Map<String, int?> rates,
    Future<void> Function(Map<String, int?> rates) onSave,
  )
  onNavigateToEditRates;

  const ProfileScreen({
    super.key,
    required this.onNavigateToSettings,
    required this.onNavigateToPostDetail,
    required this.onNavigateToEditProfile,
    required this.onNavigateToInstagram,
    required this.onNavigateToYouTube,
    required this.onNavigateToEditRates,
  });

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // ProfileTab _selectedTab = ProfileTab.posts;

  UserProfile? get user => ref.read(authProvider).value?.user;
  IntegrationNotifier get integrationNotifier =>
      ref.read(integrationProvider.notifier);

  @override
  void initState() {
    super.initState();

    Future(() {
      if (!mounted) return;

      final username = ref.read(authProvider).value?.user?.username;
      if (username == null) return;

      final profile = ref.read(profileProvider.notifier);
      if (ref.read(profileProvider).posts.isEmpty) {
        profile.fetchProfile(username, other: false);
        profile.fetchPosts(username);
      }
    });

    Future(() {
      final action = ref.read(deepLinkProvider).profileAction;
      if (action == ProfileAction.connectInstagram) {
        widget.onNavigateToInstagram();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      } else if (action == ProfileAction.connectYoutube) {
        widget.onNavigateToYouTube();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      }
    });
  }

  Future<void> _onRefresh() async {
    final profile = ref.read(profileProvider.notifier);
    final username = ref.read(authProvider).value?.user?.username;
    if (username == null) return;

    await Future.wait([
      profile.fetchProfile(username, other: false),
      profile.fetchPosts(username),
    ]);
  }

  // Future<void> _connectYouTube() async {
  //   if (user == null) return;
  //   final username = user!.username;

  //   await showAsyncToast(
  //     context,
  //     loadingMessage: 'Connecting YouTube...',
  //     successMessage: 'YouTube Connected',
  //     task: () async {
  //       await integrationNotifier.fetchYoutubeChannel();
  //       await integrationNotifier.fetchYoutubeMedia();

  //       await Future.wait([
  //         integrationNotifier.loadOwnYoutubeChannel(username),
  //         integrationNotifier.loadOwnYoutubeMedia(username),
  //       ]);

  //       await ref.read(authProvider.notifier).setYoutubeConnected(true);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final auth = ref.watch(authProvider);

    final UserProfile? user = auth.value?.user;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: "@${user?.username ?? ""}",
        actions: [
          HeaderAction(
            icon: HugeIcons.strokeRoundedEditUser02,
            contentDescription: "Edit Profile",
            onClick: widget.onNavigateToEditProfile,
          ),
          HeaderAction(
            icon: HugeIcons.strokeRoundedSettings01,
            contentDescription: "Settings",
            onClick: widget.onNavigateToSettings,
          ),
        ],
        center: false,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: kToolbarHeight + MediaQuery.of(context).padding.top,
              bottom: kBottomNavigationBarHeight + 70,
            ),
            child: Column(
              spacing: 30,
              children: [
                if (user != null) ProfileHeader(user: user),
                RateCard(onNavigateToEditRates: widget.onNavigateToEditRates),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
