import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/presentation/tab_navigator.dart';
import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/network/api_config.dart';
// import '../../core/widgets/tab_item.dart';
import '../../models/auth/auth_models.dart';
import '../../providers/search/search_notifier.dart';
import '../../widgets/clout_capsule.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final ValueChanged<TabItem> onSelectTab;
  final void Function(String username, String type) onNavigateToOtherProfile;

  const SearchScreen({
    super.key,
    required this.onSelectTab,
    required this.onNavigateToOtherProfile,
  });

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _queryController = TextEditingController();
  String _query = '';

  final _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });

    Future(() {
      if (ref.read(searchProvider).suggestions.isEmpty) {
        ref.read(searchProvider.notifier).fetchSuggestions();
      }
    });
  }

  @override
  void dispose() {
    _queryController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    setState(() => _query = value);
    if (value.isNotEmpty) {
      ref.read(searchProvider.notifier).handleSearch(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final searchState = ref.watch(searchProvider);
    final userList = _query.isEmpty
        ? searchState.suggestions
        : searchState.results;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Connect'),
      body: RefreshIndicator(
        onRefresh: () => ref.read(searchProvider.notifier).fetchSuggestions(),
        child: (searchState.suggestions.isEmpty && searchState.isLoading)
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: kToolbarHeight + topInset),
                child: const CloutEmpty(
                  type: EmptyType.general,
                  message: 'Loading...',
                  isLoading: true,
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      kToolbarHeight + topInset,
                      15,
                      0,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: TextField(
                        controller: _queryController,
                        focusNode: _focusNode,
                        onChanged: _onQueryChanged,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            onPressed: !_isFocused
                                ? null
                                : () {
                                    _queryController.clear();
                                    setState(() => _query = '');
                                    _focusNode.unfocus();
                                  },
                            icon: Icon(
                              _isFocused
                                  ? Icons.close_rounded
                                  : Icons.search_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (userList.isEmpty && _query.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 10),
                      sliver: SliverToBoxAdapter(
                        child: CloutEmpty(
                          type: .general,
                          message: 'No results found',
                          isLoading: searchState.isLoading,
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(
                        15,
                        10,
                        15,
                        MediaQuery.of(context).padding.bottom + 10,
                      ),
                      sliver: SliverMasonryGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childCount: userList.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return _UserCard(
                            key: ValueKey(user.profile.id),
                            user: user,
                            onTap: () {
                              if (user.profile.username ==
                                  ref
                                      .watch(authProvider)
                                      .value
                                      ?.user
                                      ?.profile
                                      .username) {
                                widget.onSelectTab(TabItem.profile);
                              } else {
                                widget.onNavigateToOtherProfile(
                                  user.profile.username,
                                  user.profile.userType,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final UserContainer user;
  final VoidCallback onTap;

  const _UserCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: ApiConfig.current.baseUrl + user.profile.profilePhoto,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade200),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.grey.shade200),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                user.profile.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            CloutCapsule(user.area ?? user.targetAudience ?? 'Creator'),

            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
