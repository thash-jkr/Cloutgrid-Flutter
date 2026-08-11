import 'dart:typed_data';

import 'package:flutter/material.dart';

import './create/create_screen.dart';
import './jobs/job_screen.dart';
import './profile/profile_screen.dart';
import './search/search_screen.dart';
import './home/home_screen.dart';

enum TabItem {
  home('Home', Icons.home_rounded),
  search('Search', Icons.search_rounded),
  create('Create', Icons.add_circle_rounded),
  jobs('Jobs', Icons.work_rounded),
  profile('Profile', Icons.person_rounded);

  final String title;
  final IconData icon;

  const TabItem(this.title, this.icon);
}

class TabNavigator extends StatefulWidget {
  final VoidCallback onNavigateToSettings;
  final void Function(int id, bool other) onNavigateToPostDetail;
  final VoidCallback onNavigateToEditProfile;
  final void Function(String username, String type) onNavigateToOtherProfile;
  final void Function(Uint8List selectedImage) onNavigateToCreatePost;

  const TabNavigator({
    super.key,
    required this.onNavigateToSettings,
    required this.onNavigateToPostDetail,
    required this.onNavigateToEditProfile,
    required this.onNavigateToOtherProfile,
    required this.onNavigateToCreatePost,
  });

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  late final PageController _pageController = PageController(
    initialPage: TabItem.home.index,
  );

  TabItem _selectedTab = TabItem.home;

  void _selectTab(TabItem tab) {
    _pageController.animateToPage(
      tab.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedTab = TabItem.values[index]);
        },
        children: [
          HomeScreen(
            onSelectTab: _selectTab,
            onNavigateToOtherProfile: widget.onNavigateToOtherProfile,
          ),
          SearchScreen(
            onNavigateToOtherProfile: widget.onNavigateToOtherProfile,
            onSelectTab: _selectTab,
          ),
          CreateScreen(onNavigateToCreatePost: widget.onNavigateToCreatePost),
          JobScreen(),
          ProfileScreen(
            onNavigateToSettings: widget.onNavigateToSettings,
            onNavigateToPostDetail: widget.onNavigateToPostDetail,
            onNavigateToEditProfile: widget.onNavigateToEditProfile,
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
      // Kotlin's .navigationBarsPadding() equivalent — pushes the pill
      // above the system nav bar/gesture area instead of behind it.
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
                      child: Icon(
                        tab.icon,
                        size: 25,
                        color: isSelected
                            ? Colors.white
                            : theme.colorScheme.primary,
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
