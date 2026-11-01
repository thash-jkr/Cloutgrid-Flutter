import 'package:cloutgrid_flutter/presentation/integration/instagram.dart';
import 'package:cloutgrid_flutter/presentation/integration/youtube.dart';
import 'package:cloutgrid_flutter/presentation/tab_navigator.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../providers/home/home_notifier.dart';

enum Socials {
  instagram('Instagram', HugeIcons.strokeRoundedInstagram, Colors.pink),
  youtube('YouTube', HugeIcons.strokeRoundedYoutube, Colors.red);

  final String title;
  final dynamic icon;
  final Color color;

  const Socials(this.title, this.icon, this.color);
}

class HomeScreen extends ConsumerStatefulWidget {
  final ValueChanged<TabItem> onSelectTab;
  final void Function(UserProfile user) onNavigateToOtherProfile;
  final VoidCallback onNavigateToTestScreen;

  const HomeScreen({
    super.key,
    required this.onSelectTab,
    required this.onNavigateToOtherProfile,
    required this.onNavigateToTestScreen,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();
  Socials _selectedSocial = Socials.instagram;

  void _selectSocial(Socials social) {
    setState(() => _selectedSocial = social);
  }

  @override
  void initState() {
    super.initState();

    Future(() {
      final home = ref.read(homeProvider.notifier);

      if (ref.read(homeProvider).posts.isEmpty) {
        home.fetchPosts(isFirstPage: true);
      }
      if (ref.read(homeProvider).notifications.isEmpty) {
        home.fetchNotifications();
      }
    });

    _scrollController.addListener(() {
      final home = ref.read(homeProvider.notifier);
      final state = ref.read(homeProvider);
      final nearBottom =
          _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300;

      if (nearBottom && !state.isLoading && state.nextCursor != null) {
        home.fetchPosts(isFirstPage: false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        icon: HeaderAction(
          image: const AssetImage('assets/images/cloutgrid_logo.png'),
          contentDescription: "Cloutgrid",
          onClick: () {},
        ),
        actions: [
          // HeaderAction(
          //   icon: HugeIcons.strokeRoundedWorkAlert,
          //   contentDescription: "Test",
          //   onClick: widget.onNavigateToTestScreen,
          // ),
          HeaderAction(
            icon: HugeIcons.strokeRoundedAiSwap,
            contentDescription: "Swap",
            onClick: () => cloutSheet(
              context,
              content: (context, _) => Scaffold(
                appBar: CloutHeader(title: "Socials"),
                extendBodyBehindAppBar: true,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: kToolbarHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: Socials.values.map((social) {
                      final isSelected = social == _selectedSocial;

                      return GestureDetector(
                        child: Row(
                          spacing: 5,
                          children: [
                            HugeIcon(
                              icon: social.icon,
                              color: social.color,
                              strokeWidth: 2,
                            ),
                            Text(
                              social.title,
                              style: TextStyle(fontSize: 17, fontWeight: .w500),
                            ),
                            if (isSelected)
                              HugeIcon(icon: HugeIcons.strokeRoundedCheck),
                          ],
                        ),
                        onTap: () => {
                          _selectSocial(social),
                          Navigator.pop(context),
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              shorter: true,
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: _selectedSocial == Socials.instagram ? Instagram() : Youtube(),
      ),
    );
  }
}
