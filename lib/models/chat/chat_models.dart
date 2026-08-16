import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart'; // UserContainer

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required String id,
    required UserContainer user,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);
}

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String id,
    required UserContainer sender,
    required String content,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

@freezed
abstract class ChatRoute with _$ChatRoute {
  const factory ChatRoute({required String id, required UserContainer user}) =
      _ChatRoute;

  factory ChatRoute.fromJson(Map<String, dynamic> json) =>
      _$ChatRouteFromJson(json);
}
