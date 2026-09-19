import 'package:flutter/material.dart';

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
