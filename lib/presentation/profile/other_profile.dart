import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/profile/brand_campaigns.dart';
import 'package:cloutgrid_flutter/presentation/profile/profile_header.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_alert.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class OtherProfile extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final void Function(String username, bool isConnected)
  onNavigateToOtherInstagram;
  final UserProfile user;
  final ValueChanged<int> onNavigateToQuestions;

  const OtherProfile({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToPostDetail,
    required this.onNavigateToOtherInstagram,
    required this.user,
    required this.onNavigateToQuestions,
  });

  @override
  ConsumerState<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends ConsumerState<OtherProfile> {
  String get username => widget.user.username;
  String get type => widget.user.type;

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

  void _handleBlock(bool block) async {
    try {
      await ref.read(profileProvider.notifier).handleBlock(username, block);

      if (!mounted) return;

      showToast(
        context,
        message: "${block ? "Blocked" : "Unblock"}ed @$username",
      );
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: "Something went wrong: $e", isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    final UserProfile? user = profileState.otherProfile;
    // bool isBlocked = user != null && user.isBlocking == true;

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
                  icon: HugeIcons.strokeRoundedEllipsis,
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
                    // HeaderMenuItem(
                    //   title: "${isBlocked ? "Unblock" : "Block"} @$username",
                    //   icon: Icons.block_rounded,
                    //   onClick: () => CloutAlert.show(
                    //     context,
                    //     title: '${isBlocked ? "Unblock" : "Block"} @$username?',
                    //     body:
                    //         'Do you want to ${isBlocked ? "Unblock" : "Block"} @$username?',
                    //     hasTextField: false,
                    //     onSubmit: (_) => _handleBlock(isBlocked == false),
                    //   ),
                    // ),
                  ],
                ),
              ]
            : [],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final topPad = MediaQuery.paddingOf(context).top;
            const bottomPad = kBottomNavigationBarHeight + 70;

            return SingleChildScrollView(
              padding: EdgeInsets.only(top: topPad, bottom: bottomPad),
              child: user == null
                  ? CloutEmpty(
                      type: .profile,
                      message: "Loading...",
                      isLoading: profileState.isLoading,
                    )
                  : (user.isBlocker == true || user.isBlocking == true)
                  ? SizedBox(
                      // fill the visible area, like SliverFillRemaining
                      height: constraints.maxHeight - topPad - bottomPad,
                      child: BlockedProfile(
                        isBlocker: user.isBlocking == true,
                        onBlockCLick: _handleBlock,
                      ),
                    )
                  : Column(
                      spacing: 30,
                      children: [
                        ProfileHeader(user: user),
                        BrandCampaigns(
                          username: user.username,
                          onNavigateToQuestions: widget.onNavigateToQuestions,
                        ),
                      ],
                    ),
            );
          },
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
