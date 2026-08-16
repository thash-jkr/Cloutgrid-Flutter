import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/network/api_config.dart';
import '../../core/providers/core_providers.dart';
import '../../models/chat/chat_models.dart';

part 'chat_notifier.g.dart';

class ChatState {
  final List<ConversationModel> chats;
  final List<MessageModel> messages;
  final bool isLoading;
  final bool socketConnected;
  final String? errorMessage;
  final ConversationModel? newConversation;

  const ChatState({
    this.chats = const [],
    this.messages = const [],
    this.isLoading = false,
    this.socketConnected = false,
    this.errorMessage,
    this.newConversation,
  });

  ChatState copyWith({
    List<ConversationModel>? chats,
    List<MessageModel>? messages,
    bool? isLoading,
    bool? socketConnected,
    String? errorMessage,
    bool clearErrorMessage = false,
    ConversationModel? newConversation,
    bool clearNewConversation = false,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      socketConnected: socketConnected ?? this.socketConnected,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
      newConversation: clearNewConversation
          ? null
          : (newConversation ?? this.newConversation),
    );
  }
}

@Riverpod(keepAlive: true)
class ChatNotifier extends _$ChatNotifier {
  WebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;

  @override
  ChatState build() {
    ref.onDispose(disconnectWebSocket);
    return const ChatState();
  }

  void clearNewConversation() {
    state = state.copyWith(clearNewConversation: true);
  }

  Future<void> fetchConversations() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<ConversationModel>>(
            '/chats/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map(
                  (e) => ConversationModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(chats: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> createConversation(int id) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final response = await ref
          .read(apiServiceProvider)
          .request<ConversationModel>(
            '/chats/$id/',
            method: 'POST',
            fromJson: (json) => ConversationModel.fromJson(json),
            body: <String, String>{},
            requireAuth: true,
          );

      final alreadyExists = state.chats.any((c) => c.id == response.id);
      state = state.copyWith(
        chats: alreadyExists ? state.chats : [response, ...state.chats],
        newConversation: response,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchMessages(String id) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<MessageModel>>(
            '/chats/${id.toLowerCase()}/messages/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(messages: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> connectWebSocket(String conversationId) async {
    if (_channel != null) return; // already connected

    final token = await ref.read(secureStorageProvider).access;
    if (token == null) {
      state = state.copyWith(errorMessage: 'Not authenticated');
      return;
    }

    try {
      final uri = Uri.parse(
        '${ApiConfig.current.socketUrl}/chat/${conversationId.toLowerCase()}/?token=$token',
      );
      _channel = WebSocketChannel.connect(uri);
      state = state.copyWith(socketConnected: true);

      _channelSubscription = _channel!.stream.listen(
        (data) => _handleIncomingMessage(data as String),
        onError: (_) {
          state = state.copyWith(socketConnected: false);
          _channel = null;
        },
        onDone: () {
          state = state.copyWith(socketConnected: false);
          _channel = null;
        },
      );
    } catch (_) {
      state = state.copyWith(socketConnected: false);
    }
  }

  void disconnectWebSocket() {
    _channelSubscription?.cancel();
    _channelSubscription = null;
    _channel?.sink.close();
    _channel = null;

    Future(() {
      state = state.copyWith(socketConnected: false);
    });
  }

  void sendLiveMessage(String content) {
    final channel = _channel;
    if (channel == null) return;
    final payload = jsonEncode({'content': content});
    channel.sink.add(payload);
  }

  void _handleIncomingMessage(String jsonString) {
    try {
      final message = MessageModel.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );
      if (!state.messages.any((m) => m.id == message.id)) {
        state = state.copyWith(messages: [message, ...state.messages]);
      }
    } catch (_) {}
  }
}
