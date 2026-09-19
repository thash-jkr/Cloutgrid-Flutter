import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ProfileTab {
  posts(label: 'Posts', icon: Icons.grid_3x3_rounded),
  collabs(
    label: 'Collabs',
    icon: Icons.handshake_rounded,
    userType: 'business',
  ),
  instagram(
    label: 'Instagram',
    asset: 'assets/icons/instagram.svg',
    selectable: false,
    userType: 'creator',
  ),
  youtube(
    label: 'YouTube',
    asset: 'assets/icons/youtube.svg',
    selectable: false,
    userType: 'creator',
  );

  const ProfileTab({
    required this.label,
    this.icon,
    this.asset,
    this.selectable = true,
    this.userType,
  });

  final String label;
  final IconData? icon;
  final String? asset;
  final bool selectable;

  final String? userType;

  bool isVisibleFor(String type) => userType == null || userType == type;

  static List<ProfileTab> visibleFor(String type) =>
      values.where((tab) => tab.isVisibleFor(type)).toList();
}

class ProfileSelector extends StatelessWidget {
  final ProfileTab selectedTab;
  final ValueChanged<ProfileTab> onTabSelected;
  final UserProfile user;

  const ProfileSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Center(
        child: user.type == "creator"
            ? Row(
                spacing: 15,
                children: [
                  OutlinedButton(
                    onPressed: () => onTabSelected(.instagram),
                    child: Row(
                      spacing: 5,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/instagram.svg",
                          width: 25,
                          height: 25,
                          colorFilter: ColorFilter.mode(
                            Colors.pink,
                            BlendMode.srcIn,
                          ),
                        ),
                        user.instagramFollowers != null
                            ? Text("${user.instagramFollowers}")
                            : Icon(Icons.info_outline_rounded),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => onTabSelected(.youtube),
                    child: Row(
                      spacing: 5,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/youtube.svg",
                          width: 25,
                          height: 25,
                          colorFilter: ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        user.youtubeSubscribers != null
                            ? Text("${user.youtubeSubscribers}")
                            : Icon(Icons.info_outline_rounded),
                      ],
                    ),
                  ),
                ],
              )
            : SegmentedButton<ProfileTab>(
                segments: [
                  ButtonSegment(
                    value: ProfileTab.posts,
                    icon: Icon(ProfileTab.posts.icon),
                    label: Text(ProfileTab.posts.label),
                  ),

                  ButtonSegment(
                    value: ProfileTab.collabs,
                    icon: Icon(ProfileTab.collabs.icon),
                    label: Text(ProfileTab.collabs.label),
                  ),
                ],
                selected: {selectedTab},
                onSelectionChanged: (newSelection) =>
                    onTabSelected(newSelection.first),
                style: SegmentedButton.styleFrom(
                  selectedBackgroundColor: Theme.of(
                    context,
                  ).colorScheme.secondary,
                  selectedForegroundColor: Colors.white,
                ),
              ),
      ),
    );
  }
}
