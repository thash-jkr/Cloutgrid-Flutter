import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/integration/other_instagram.dart';
import 'package:cloutgrid_flutter/presentation/integration/other_youtube.dart';
import 'package:cloutgrid_flutter/presentation/profile/post_grid.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_header.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_selector.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_alert.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherProfile extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final UserContainer user;

  const OtherProfile({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToPostDetail,
    required this.user,
  });

  @override
  ConsumerState<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends ConsumerState<OtherProfile> {
  ProfileTab _selectedTab = ProfileTab.posts;

  String get username => widget.user.profile.username;
  String get type => widget.user.profile.userType;

  late final ProfileNotifier profile;

  @override
  void initState() {
    super.initState();

    profile = ref.read(profileProvider.notifier);

    Future(() {
      profile.fetchProfile(username, other: true);
      profile.fetchPosts(username, other: true);

      if (type == 'business') {
        profile.fetchCollabs(username, other: true);
      }
    });
  }

  @override
  void dispose() {
    profile.clearOtherProfileData();
    super.dispose();
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
      content: (context, scrollController) => OtherInstagram(
        username: username,
        isConnected: widget.user.instagramConnected == true,
        scrollController: scrollController,
      ),
      short: widget.user.instagramConnected != true,
    );
  }

  void _openYouTube() {
    cloutSheet(
      context,
      content: (context, scrollController) => OtherYoutube(
        username: username,
        isConnected: widget.user.youtubeConnected == true,
        scrollController: scrollController,
      ),
      short: widget.user.youtubeConnected != true,
    );
  }

  void _handleBlock(bool block) async {
    try {
      await ref.read(profileProvider.notifier).handleBlock(username, block);

      if (!mounted) return;

      showToast(
        context,
        message: "${block ? "BLocked" : "Unblock"}ed @$username",
      );
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: "Something went wrong: $e", isSuccess: false);
    }
  }

  List<Widget> _buildTabContent() {
    final profile = ref.watch(profileProvider);

    switch (_selectedTab) {
      case ProfileTab.posts:
        if (profile.otherPosts.isEmpty) {
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
            posts: profile.otherPosts,
            onPostTap: (post) {
              widget.onNavigateToPostDetail(post.id, true);
            },
          ),
        ];

      case ProfileTab.collabs:
        if (profile.otherCollabs.isEmpty) {
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
        return [
          PostGrid(
            posts: profile.otherCollabs,
            onPostTap: (post) => {widget.onNavigateToPostDetail(post.id, true)},
          ),
        ];

      default:
        return const [SliverToBoxAdapter(child: SizedBox.shrink())];
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    final UserContainer? user = profileState.otherProfile;
    bool isBlocked = user != null && user.isBlocking == true;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
        title: "@$username",
        center: false,
        actions: user != null
            ? [
                HeaderAction(
                  icon: user.isFollowing == true
                      ? Icons.person_remove_rounded
                      : Icons.person_add_alt_rounded,
                  contentDescription: "follow",
                  onClick: () => user.isFollowing == true
                      ? CloutAlert.show(
                          context,
                          title: "Unfollow @$username?",
                          body: "Do you want to unfollow @$username?",
                          onSubmit: (_) => ref
                              .watch(profileProvider.notifier)
                              .handleFollow(user.profile.username, false),
                        )
                      : ref
                            .watch(profileProvider.notifier)
                            .handleFollow(user.profile.username, true),
                  disabled: (user.isBlocker == true || user.isBlocking == true),
                ),
                HeaderAction(
                  icon: Icons.menu_rounded,
                  contentDescription: "Open menu",
                  menuItems: [
                    HeaderMenuItem(
                      title: "Report a problem",
                      icon: Icons.warning_rounded,
                      onClick: () => CloutAlert.show(
                        context,
                        title: 'Report a problem',
                        body: 'If you encountered any issues, let us know.',
                        hasTextField: true,
                        onSubmit: (_) {
                          showToast(context, message: "Reported");
                        },
                      ),
                    ),
                    HeaderMenuItem(
                      title: "Report @$username",
                      icon: Icons.report_gmailerrorred_rounded,
                      onClick: () => CloutAlert.show(
                        context,
                        title: 'Report @$username?',
                        body:
                            'Tell us why you want to report this user. Our team will take appropriate action',
                        hasTextField: true,
                        onSubmit: (_) {
                          showToast(context, message: "Reported");
                        },
                      ),
                    ),
                    HeaderMenuItem(
                      title: "${isBlocked ? "Unblock" : "Block"} @$username",
                      icon: Icons.block_rounded,
                      onClick: () => CloutAlert.show(
                        context,
                        title: '${isBlocked ? "Unblock" : "Block"} @$username?',
                        body:
                            'Do you want to ${isBlocked ? "Unblock" : "Block"} @$username?',
                        hasTextField: false,
                        onSubmit: (_) => _handleBlock(isBlocked == false),
                      ),
                    ),
                  ],
                ),
              ]
            : [],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
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
                    if (user.isBlocker == false &&
                        user.isBlocking == false) ...[
                      SliverToBoxAdapter(child: ProfileHeader(user: user)),

                      SliverToBoxAdapter(
                        child: ProfileSelector(
                          selectedTab: _selectedTab,
                          onTabSelected: _onTabSelected,
                          type: type,
                        ),
                      ),

                      ..._buildTabContent(),
                    ] else ...[
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: BlockedProfile(
                          isBlocker: user.isBlocking == true,
                          onBlockCLick: _handleBlock,
                        ),
                      ),
                    ],
                  ] else ...[
                    SliverToBoxAdapter(
                      child: CloutEmpty(
                        type: .profile,
                        message: "Loading...",
                        isLoading: profileState.isLoading,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlockedProfile extends StatelessWidget {
  final bool isBlocker;
  final void Function(bool block) onBlockCLick;

  const BlockedProfile({
    super.key,
    required this.isBlocker,
    required this.onBlockCLick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CloutEmpty(type: .block, message: "You cannot view this profile"),

        if (isBlocker) ...[
          FilledButton(
            onPressed: () => onBlockCLick(false),
            child: Text("Unblock"),
          ),
        ],
      ],
    );
  }
}
