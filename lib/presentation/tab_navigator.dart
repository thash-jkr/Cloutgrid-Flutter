import 'dart:typed_data';

import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/chats/conversations.dart';
import 'package:cloutgrid_flutter/presentation/home/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import './jobs/job_screen.dart';
import './profile/profile_screen.dart';
import './home/home_screen.dart';

enum TabItem {
  home('Home', HugeIcons.strokeRoundedHome07),
  notifications('Notifications', HugeIcons.strokeRoundedBell),
  jobs('Jobs', HugeIcons.strokeRoundedBriefcase01),
  chats('Chats', HugeIcons.strokeRoundedBubbleChat),
  profile('Profile', HugeIcons.strokeRoundedUserCircle);

  final String title;
  final dynamic icon;

  const TabItem(this.title, this.icon);
}

class TabNavigator extends ConsumerStatefulWidget {
  final VoidCallback onNavigateToSettings;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final void Function(String id, String username, String profilePhoto)
  onNavigateToMessages;
  final VoidCallback onNavigateToEditProfile;
  final void Function(
    String title,
    Map<String, int?> rates,
    Future<void> Function(Map<String, int?> rates) onSave,
  )
  onNavigateToEditRates;
  final void Function(UserProfile user) onNavigateToOtherProfile;
  final void Function(Uint8List selectedImage) onNavigateToCreatePost;
  final void Function(int id) onNavigateToQuestions;
  final void Function() onNavigateToInstagram;
  final void Function() onNavigateToYouTube;
  final void Function() onNavigateToTestScreen;

  const TabNavigator({
    super.key,
    required this.onNavigateToSettings,
    required this.onNavigateToPostDetail,
    required this.onNavigateToMessages,
    required this.onNavigateToEditProfile,
    required this.onNavigateToEditRates,
    required this.onNavigateToOtherProfile,
    required this.onNavigateToCreatePost,
    required this.onNavigateToQuestions,
    required this.onNavigateToInstagram,
    required this.onNavigateToYouTube,
    required this.onNavigateToTestScreen,
  });

  @override
  ConsumerState<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends ConsumerState<TabNavigator> {
  late final PageController _pageController = PageController(
    initialPage: TabItem.home.index,
  );

  TabItem _selectedTab = TabItem.home;

  void _selectTab(TabItem tab) {
    _pageController.jumpToPage(tab.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedTab = TabItem.values[index]);
        },
        children: [
          HomeScreen(
            onSelectTab: _selectTab,
            onNavigateToOtherProfile: widget.onNavigateToOtherProfile,
            onNavigateToTestScreen: widget.onNavigateToTestScreen,
          ),
          Notifications(),
          JobScreen(
            onNavigateToQuestions: widget.onNavigateToQuestions,
            onNavigateToOtherProfile: widget.onNavigateToOtherProfile,
          ),
          Conversations(onNavigateToMessages: widget.onNavigateToMessages),
          ProfileScreen(
            onNavigateToSettings: widget.onNavigateToSettings,
            onNavigateToPostDetail: widget.onNavigateToPostDetail,
            onNavigateToEditProfile: widget.onNavigateToEditProfile,
            onNavigateToInstagram: widget.onNavigateToInstagram,
            onNavigateToYouTube: widget.onNavigateToYouTube,
            onNavigateToEditRates: widget.onNavigateToEditRates,
          ),
        ],
      ),
      bottomNavigationBar: _PillBottomBar(
        selectedTab: _selectedTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}

class _PillBottomBar extends StatelessWidget {
  final TabItem selectedTab;
  final ValueChanged<TabItem> onSelectTab;

  const _PillBottomBar({required this.selectedTab, required this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        15,
        0,
        15,
        bottomInset > 0 ? bottomInset : 15,
      ),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 0,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: TabItem.values.map((tab) {
              final isSelected = tab == selectedTab;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onSelectTab(tab),
                child: SizedBox(
                  height: double.infinity,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? theme.colorScheme.secondary
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: tab.icon,
                          color: isSelected
                              ? Colors.white
                              : theme.colorScheme.primary,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
