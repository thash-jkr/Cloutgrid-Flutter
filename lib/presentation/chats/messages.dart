import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_config.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/chat/chat_notifier.dart';
import '../../widgets/clout_header.dart';

class Messages extends ConsumerStatefulWidget {
  final String id;
  final VoidCallback onNavigateBack;
  final String username; // the OTHER person in this conversation
  final String profilePhoto; // the OTHER person's photo

  const Messages({
    super.key,
    required this.id,
    required this.onNavigateBack,
    required this.username,
    required this.profilePhoto,
  });

  @override
  ConsumerState<Messages> createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  final _messageController = TextEditingController();
  late final ChatNotifier _chatNotifier;

  @override
  void initState() {
    super.initState();

    _chatNotifier = ref.read(chatProvider.notifier);

    Future(() {
      final notifier = ref.read(chatProvider.notifier);
      notifier.disconnectWebSocket();
      notifier.fetchMessages(widget.id);
      notifier.connectWebSocket(widget.id);
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _chatNotifier.disconnectWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    final messages = ref.watch(chatProvider.select((s) => s.messages));
    final myPhoto = ref.watch(
      authProvider.select((s) => s.value?.user?.profile.profilePhoto),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: '@${widget.username}',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'back button',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            reverse: true,
            padding: EdgeInsets.fromLTRB(
              15,
              kToolbarHeight + topInset,
              15,
              bottomInset + 60,
            ),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return _ChatRow(
                content: message.content,
                date: timeAgo(message.createdAt),
                isSender: message.sender.profile.username != widget.username,
                profilePhoto: widget.profilePhoto,
              );
            },
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? 15
                : MediaQuery.of(context).padding.bottom,
            child: CloutInput(
              onSend: (text) =>
                  ref.read(chatProvider.notifier).sendLiveMessage(text),
              avatarUrl: myPhoto != null
                  ? ApiConfig.current.baseUrl + myPhoto
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatRow extends StatelessWidget {
  final String content;
  final String date;
  final bool isSender;
  final String profilePhoto;

  const _ChatRow({
    required this.content,
    required this.date,
    required this.isSender,
    required this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isSender ? .end : .start,
        children: [
          if (!isSender)
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: ApiConfig.current.baseUrl + profilePhoto,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircleAvatar(radius: 15),
                errorWidget: (context, url, error) =>
                    const CircleAvatar(radius: 15),
              ),
            ),

          const SizedBox(width: 5),

          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: isSender ? 100 : 0,
                right: isSender ? 0 : 100,
              ),
              child: Column(
                crossAxisAlignment: isSender ? .start : .end,
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSender
                          ? theme.colorScheme.primary
                          : theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      content,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
