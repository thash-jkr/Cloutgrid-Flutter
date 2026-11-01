import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/chat/chat_notifier.dart';
import '../../widgets/category_list.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';

class Conversations extends ConsumerStatefulWidget {
  final void Function(String id, String username, String photoUrl)
  onNavigateToMessages;

  const Conversations({super.key, required this.onNavigateToMessages});

  @override
  ConsumerState<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends ConsumerState<Conversations> {
  final _queryController = TextEditingController();
  // String _query = '';

  final _focusNode = FocusNode();
  // bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      // setState(() => _isFocused = _focusNode.hasFocus);
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

  // void _onQueryChanged(String value) {
  //   setState(() => _query = value);
  //   if (value.isNotEmpty) {
  //     ref.read(searchProvider.notifier).handleSearch(value);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    final chatState = ref.watch(chatProvider);
    final chats = chatState.chats;

    ref.listen(chatProvider.select((s) => s.newConversation), (previous, next) {
      if (next != null) {
        widget.onNavigateToMessages(
          next.id,
          next.user.username,
          next.user.profilePhoto,
        );
        ref.read(chatProvider.notifier).clearNewConversation();
      }
    });

    return Scaffold(
      appBar: CloutHeader(title: "Chats"),
      extendBodyBehindAppBar: true,
      body: chats.isEmpty
          ? SingleChildScrollView(
              padding: EdgeInsets.only(top: kToolbarHeight + topInset),
              child: CloutEmpty(
                type: EmptyType.chat,
                message: 'No conversations yet',
                isLoading: chatState.isLoading,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(top: kToolbarHeight + topInset),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  title: Text(chat.user.name),
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: chat.user.profilePhoto,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Image(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  subtitle: Text(CategoryList.labelFor(chat.user.category)),
                  onTap: () => widget.onNavigateToMessages(
                    chat.id,
                    chat.user.username,
                    chat.user.profilePhoto,
                  ),
                );
              },
            ),
    );

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: CloutHeader(title: 'Chats'),
    //   body: ListView(
    //     padding: EdgeInsets.fromLTRB(
    //       15,
    //       kToolbarHeight + topInset + 15,
    //       15,
    //       100,
    //     ),
    //     children: [
    //       if (chatState.chats.isEmpty && _query.isEmpty)
    //         CloutEmpty(
    //           type: EmptyType.chat,
    //           message: 'No conversations yet',
    //           isLoading: chatState.isLoading,
    //         ),

    //       if (_query.isEmpty)
    //         ...chatState.chats.asMap().entries.map((entry) {
    //           final index = entry.key;
    //           final conversation = entry.value;

    //           return Padding(
    //             padding: const EdgeInsets.only(bottom: 1),
    //             child: SegmentedListItem(
    //               index: index,
    //               count: chatState.chats.length,
    //               leading: ClipOval(
    //                 child: CachedNetworkImage(
    //                   imageUrl: conversation.user.profilePhoto,
    //                   width: 50,
    //                   height: 50,
    //                   fit: BoxFit.cover,
    //                   placeholder: (context, url) => const Image(
    //                     image: AssetImage('assets/images/profile.png'),
    //                   ),
    //                   errorWidget: (context, url, error) => const Image(
    //                     image: AssetImage('assets/images/profile.png'),
    //                   ),
    //                 ),
    //               ),
    //               title: conversation.user.name,
    //               subtitle: CategoryList.labelFor(conversation.user.category),
    //               onTap: () => widget.onNavigateToMessages(
    //                 conversation.id,
    //                 conversation.user.username,
    //                 conversation.user.profilePhoto,
    //               ),
    //             ),
    //           );
    //         })
    //       else if (searchState.results.isEmpty)
    //         CloutEmpty(
    //           type: EmptyType.general,
    //           message: 'No creators or brands found',
    //           isLoading: searchState.isLoading,
    //         )
    //       else
    //         ...searchState.results.asMap().entries.map((entry) {
    //           final index = entry.key;
    //           final user = entry.value;

    //           return Padding(
    //             padding: const EdgeInsets.only(bottom: 2),
    //             child: SegmentedListItem(
    //               index: index,
    //               count: searchState.results.length,
    //               leading: ClipOval(
    //                 child: CachedNetworkImage(
    //                   imageUrl: user.profilePhoto,
    //                   width: 50,
    //                   height: 50,
    //                   fit: BoxFit.cover,
    //                   placeholder: (context, url) =>
    //                       const CircleAvatar(radius: 25),
    //                   errorWidget: (context, url, error) =>
    //                       const CircleAvatar(radius: 25),
    //                 ),
    //               ),
    //               title: user.name,
    //               subtitle: CategoryList.labelFor(user.category),
    //               onTap: () => ref
    //                   .read(chatProvider.notifier)
    //                   .createConversation(user.id),
    //             ),
    //           );
    //         }),
    //     ],
    //   ),
    // );
  }
}
