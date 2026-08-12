import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/integration/instagram.dart';
import 'package:cloutgrid_flutter/presentation/integration/youtube.dart';
import 'package:cloutgrid_flutter/presentation/profile/post_grid.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_header.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_selector.dart';
import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
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

  @override
  void initState() {
    super.initState();

    Future(() {
      if (!mounted) return;

      final username = ref.read(authProvider).value?.user?.profile.username;
      if (username == null) return;

      final profile = ref.read(profileProvider.notifier);
      if (ref.read(profileProvider).posts.isEmpty) {
        profile.fetchPosts(username);
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
    cloutSheet(context, content: const Instagram());
  }

  void _openYouTube() {
    cloutSheet(context, content: const Youtube());
  }

  Future<void> _onRefresh() async {
    final profile = ref.read(profileProvider.notifier);
    final username = ref.read(authProvider).value?.user?.profile.username;
    if (username == null) return;

    await Future.wait([
      profile.fetchProfile(username, other: false),
      profile.fetchPosts(username),
    ]);
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

    final UserContainer? user = auth.value?.user;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: "@${user?.profile.username ?? ""}",
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
                    if (user != null)
                      SliverToBoxAdapter(child: ProfileHeader(user: user)),

                    SliverToBoxAdapter(
                      child: ProfileSelector(
                        selectedTab: _selectedTab,
                        onTabSelected: _onTabSelected,
                        type: user?.profile.userType ?? 'creator',
                      ),
                    ),

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
