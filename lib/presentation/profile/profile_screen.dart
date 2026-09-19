import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/integration/instagram.dart';
import 'package:cloutgrid_flutter/presentation/integration/youtube.dart';
import 'package:cloutgrid_flutter/presentation/profile/post_grid.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_header.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_selector.dart';
import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:cloutgrid_flutter/providers/auth/deep_link_notifier.dart';
import 'package:cloutgrid_flutter/providers/integration/integration_notifier.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final VoidCallback onNavigateToSettings;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final VoidCallback onNavigateToEditProfile;

  const ProfileScreen({
    super.key,
    required this.onNavigateToSettings,
    required this.onNavigateToPostDetail,
    required this.onNavigateToEditProfile,
  });

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ProfileTab _selectedTab = ProfileTab.posts;

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
        _openInstagram();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      } else if (action == ProfileAction.connectYoutube) {
        _openYouTube();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      }
    });
  }

  void _onTabSelected(ProfileTab tab) {
    if (tab.selectable) {
      setState(() => _selectedTab = tab);
    } else {
      if (tab.label == "Instagram") {
        _openInstagram();
      } else if (tab.label == "YouTube") {
        _openYouTube();
      }
    }
  }

  void _openInstagram() {
    cloutSheet(
      context,
      content: (context, scrollController) =>
          Instagram(scrollController: scrollController),
    );
  }

  void _openYouTube() {
    cloutSheet(
      context,
      content: (context, scrollController) =>
          Youtube(scrollController: scrollController),
    );
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

  Future<void> _connectInstagram() async {
    if (user == null) return;
    final username = user!.username;

    await showAsyncToast(
      context,
      loadingMessage: 'Connecting Instagram...',
      successMessage: 'Instagram Connected',
      task: () async {
        await integrationNotifier.fetchInstagramProfile();
        await integrationNotifier.fetchInstagramMedia();

        await Future.wait([
          integrationNotifier.loadOwnInstagramProfile(username),
          integrationNotifier.loadOwnInstagramMedia(username),
        ]);

        await ref.read(authProvider.notifier).setInstagramConnected(true);
      },
    );
  }

  Future<void> _connectYouTube() async {
    if (user == null) return;
    final username = user!.username;

    await showAsyncToast(
      context,
      loadingMessage: 'Connecting YouTube...',
      successMessage: 'YouTube Connected',
      task: () async {
        await integrationNotifier.fetchYoutubeChannel();
        await integrationNotifier.fetchYoutubeMedia();

        await Future.wait([
          integrationNotifier.loadOwnYoutubeChannel(username),
          integrationNotifier.loadOwnYoutubeMedia(username),
        ]);

        await ref.read(authProvider.notifier).setYoutubeConnected(true);
      },
    );
  }

  List<Widget> _buildTabContent() {
    final profile = ref.watch(profileProvider);

    switch (_selectedTab) {
      case ProfileTab.posts:
        if (profile.posts.isEmpty) {
          return [
            SliverFillRemaining(
              hasScrollBody: false,
              child: CloutEmpty(
                type: .post,
                message: 'No posts found',
                isLoading: profile.isLoading,
              ),
            ),
          ];
        }
        return [
          PostGrid(
            posts: profile.posts,
            onPostTap: (post) {
              widget.onNavigateToPostDetail(post.id, false);
            },
          ),
        ];

      case ProfileTab.collabs:
        if (profile.collabs.isEmpty) {
          return [
            SliverFillRemaining(
              hasScrollBody: false,
              child: CloutEmpty(
                type: .post,
                message: 'No collabs found',
                isLoading: profile.isLoading,
              ),
            ),
          ];
        }
        return [PostGrid(posts: profile.collabs, onPostTap: (post) => {})];

      default:
        return const [SliverToBoxAdapter(child: SizedBox.shrink())];
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final auth = ref.watch(authProvider);

    final UserProfile? user = auth.value?.user;

    ref.listen(deepLinkProvider.select((s) => s.profileAction), (
      previous,
      next,
    ) {
      if (next == ProfileAction.connectInstagram) {
        _connectInstagram();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      } else if (next == ProfileAction.connectYoutube) {
        _connectYouTube();
        ref.read(deepLinkProvider.notifier).clearProfileAction();
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: "@${user?.username ?? ""}",
        actions: [
          HeaderAction(
            icon: Icons.edit_rounded,
            contentDescription: "Edit Profile",
            onClick: widget.onNavigateToEditProfile,
          ),
          HeaderAction(
            icon: Icons.settings_rounded,
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
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  top: kToolbarHeight + MediaQuery.of(context).padding.top,
                  bottom: kBottomNavigationBarHeight + 70,
                ),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    if (user != null) ...[
                      SliverToBoxAdapter(child: ProfileHeader(user: user)),

                      SliverToBoxAdapter(
                        child: ProfileSelector(
                          selectedTab: _selectedTab,
                          onTabSelected: _onTabSelected,
                          user: user,
                        ),
                      ),
                    ],

                    ..._buildTabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
