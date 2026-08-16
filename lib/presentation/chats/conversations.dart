import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_config.dart';
import '../../providers/chat/chat_notifier.dart';
import '../../providers/search/search_notifier.dart';
import '../../widgets/category_list.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/segmented_list.dart';

class Conversations extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;
  final void Function(String id, String username, String photoUrl)
  onNavigateToMessages;

  const Conversations({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToMessages,
  });

  @override
  ConsumerState<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends ConsumerState<Conversations> {
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
      if (ref.read(chatProvider).chats.isEmpty) {
        ref.read(chatProvider.notifier).fetchConversations();
      }
    });
  }

  @override
  void dispose() {
    _queryController.dispose();
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

    final chatState = ref.watch(chatProvider);
    final searchState = ref.watch(searchProvider);

    ref.listen(chatProvider.select((s) => s.newConversation), (previous, next) {
      if (next != null) {
        widget.onNavigateToMessages(
          next.id,
          next.user.profile.username,
          next.user.profile.profilePhoto,
        );
        ref.read(chatProvider.notifier).clearNewConversation();
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Chats',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back button',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          15,
          kToolbarHeight + topInset + 15,
          15,
          100,
        ),
        children: [
          TextField(
            controller: _queryController,
            focusNode: _focusNode,
            onChanged: _onQueryChanged,
            maxLines: 1,
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
                  _isFocused ? Icons.close_rounded : Icons.search_rounded,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          if (chatState.chats.isEmpty && _query.isEmpty)
            CloutEmpty(
              type: EmptyType.comment,
              message: 'No conversations yet',
              isLoading: chatState.isLoading,
            ),

          if (_query.isEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatState.chats.length,
              separatorBuilder: (context, index) => const SizedBox(height: 1),
              itemBuilder: (context, index) {
                final conversation = chatState.chats[index];

                return SegmentedListItem(
                  index: index,
                  count: chatState.chats.length,
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConfig.current.baseUrl +
                          conversation.user.profile.profilePhoto,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircleAvatar(radius: 25),
                      errorWidget: (context, url, error) =>
                          const CircleAvatar(radius: 25),
                    ),
                  ),
                  title: conversation.user.profile.name,
                  subtitle: CategoryList.labelFor(
                    conversation.user.area ??
                        conversation.user.targetAudience ??
                        '',
                  ),
                  onTap: () => widget.onNavigateToMessages(
                    conversation.id,
                    conversation.user.profile.username,
                    conversation.user.profile.profilePhoto,
                  ),
                );
              },
            )
          else if (searchState.results.isEmpty)
            CloutEmpty(
              type: EmptyType.general,
              message: 'No creators or brands found',
              isLoading: searchState.isLoading,
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchState.results.length,
              separatorBuilder: (context, index) => const SizedBox(height: 2),
              itemBuilder: (context, index) {
                final user = searchState.results[index];

                return SegmentedListItem(
                  index: index,
                  count: searchState.results.length,
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConfig.current.baseUrl + user.profile.profilePhoto,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircleAvatar(radius: 25),
                      errorWidget: (context, url, error) =>
                          const CircleAvatar(radius: 25),
                    ),
                  ),
                  title: user.profile.name,
                  subtitle: CategoryList.labelFor(
                    user.area ?? user.targetAudience ?? '',
                  ),
                  onTap: () => ref
                      .read(chatProvider.notifier)
                      .createConversation(user.profile.id),
                );
              },
            ),
        ],
      ),
    );
  }
}
