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

  /// Which user type this tab is restricted to. `null` means always shown.
  final String? userType;

  bool isVisibleFor(String type) => userType == null || userType == type;

  static List<ProfileTab> visibleFor(String type) =>
      values.where((tab) => tab.isVisibleFor(type)).toList();
}

class ProfileSelector extends StatelessWidget {
  final ProfileTab selectedTab;
  final ValueChanged<ProfileTab> onTabSelected;
  final String type;

  const ProfileSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ProfileTab.visibleFor(type);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < tabs.length; i++) ...[
                if (i > 0) const SizedBox(width: 25),
                _TabItem(
                  tab: tabs[i],
                  isSelected: tabs[i].selectable && selectedTab == tabs[i],
                  onTap: () => onTabSelected(tabs[i]),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final ProfileTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tint = isSelected ? Colors.white : colorScheme.primary;

    return Material(
      color: isSelected ? colorScheme.secondary : Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Semantics(
            label: tab.label,
            child: tab.icon != null
                ? Icon(tab.icon, size: 25, color: tint)
                : SvgPicture.asset(
                    tab.asset!,
                    width: 25,
                    height: 25,
                    colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
                  ),
          ),
        ),
      ),
    );
  }
}
