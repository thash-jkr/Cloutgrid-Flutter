// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: (json['id'] as num).toInt(),
      message: json['message'] as String,
      photo: json['photo'] as String,
      isRead: json['is_read'] as bool,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'photo': instance.photo,
      'is_read': instance.isRead,
    };

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  id: (json['id'] as num).toInt(),
  author: UserProfile.fromJson(json['author'] as Map<String, dynamic>),
  postedBy: UserContainer.fromJson(json['posted_by'] as Map<String, dynamic>),
  collaboration: json['collaboration'] == null
      ? null
      : UserContainer.fromJson(json['collaboration'] as Map<String, dynamic>),
  likeCount: (json['like_count'] as num).toInt(),
  commentCount: (json['comment_count'] as num).toInt(),
  isLiked: json['is_liked'] as bool,
  image: json['image'] as String,
  aspect: json['aspect'] as String,
  caption: json['caption'] as String,
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'posted_by': instance.postedBy,
      'collaboration': instance.collaboration,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'is_liked': instance.isLiked,
      'image': instance.image,
      'aspect': instance.aspect,
      'caption': instance.caption,
    };

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: (json['id'] as num).toInt(),
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      commentedAt: json['commented_at'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'content': instance.content,
      'commented_at': instance.commentedAt,
    };

_LikeResponse _$LikeResponseFromJson(Map<String, dynamic> json) =>
    _LikeResponse(
      liked: json['liked'] as bool,
      likeCount: (json['like_count'] as num).toInt(),
    );

Map<String, dynamic> _$LikeResponseToJson(_LikeResponse instance) =>
    <String, dynamic>{
      'liked': instance.liked,
      'like_count': instance.likeCount,
    };

_PostResponse _$PostResponseFromJson(Map<String, dynamic> json) =>
    _PostResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PostResponseToJson(_PostResponse instance) =>
    <String, dynamic>{'results': instance.results, 'next': instance.next};
