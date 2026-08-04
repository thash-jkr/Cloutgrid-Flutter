import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart';

part 'home_models.freezed.dart';
part 'home_models.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String message,
    required String photo,
    @JsonKey(name: 'is_read') required bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required UserProfile author,
    @JsonKey(name: 'posted_by') required UserContainer postedBy,
    UserContainer? collaboration,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
    required String image,
    required String aspect,
    required String caption,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

@freezed
abstract class CommentModel with _$CommentModel {
  const CommentModel._();

  const factory CommentModel({
    required int id,
    required UserProfile user,
    required String content,
    @JsonKey(name: 'commented_at') required String commentedAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  String get timeAgo {
    try {
      final commented = DateTime.parse(commentedAt);
      final diff = DateTime.now().difference(commented);

      if (diff.inSeconds < 60) return 'Just now';
      if (diff.inMinutes < 60) return '${diff.inMinutes}m';
      if (diff.inHours < 24) return '${diff.inHours}h';
      if (diff.inDays < 7) return '${diff.inDays}d';
      if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w';
      if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo';
      return '${(diff.inDays / 365).floor()}y';
    } catch (_) {
      return 'Just now';
    }
  }
}

@freezed
abstract class LikeResponse with _$LikeResponse {
  const factory LikeResponse({
    required bool liked,
    @JsonKey(name: 'like_count') required int likeCount,
  }) = _LikeResponse;

  factory LikeResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseFromJson(json);
}

@freezed
abstract class PostResponse with _$PostResponse {
  const factory PostResponse({required List<PostModel> results, String? next}) =
      _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}
