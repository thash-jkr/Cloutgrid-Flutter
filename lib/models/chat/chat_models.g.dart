// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: json['id'] as String,
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ConversationModelToJson(_ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'created_at': instance.createdAt,
    };

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      sender: UserProfile.fromJson(json['sender'] as Map<String, dynamic>),
      content: json['content'] as String,
      isRead: json['is_read'] as bool,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'content': instance.content,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };

_MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    _MessageResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$MessageResponseToJson(_MessageResponse instance) =>
    <String, dynamic>{'results': instance.results, 'next': instance.next};

_ChatRoute _$ChatRouteFromJson(Map<String, dynamic> json) => _ChatRoute(
  id: json['id'] as String,
  user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatRouteToJson(_ChatRoute instance) =>
    <String, dynamic>{'id': instance.id, 'user': instance.user};
