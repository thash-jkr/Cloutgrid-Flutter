import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart';

part 'home_models.freezed.dart';
part 'home_models.g.dart';

String timeAgo(String createdAt) {
  try {
    final commented = DateTime.parse(createdAt);
    final diff = DateTime.now().difference(commented);

    if (diff.inSeconds < 60) return 'Just now';

    if (diff.inMinutes < 60) {
      final m = diff.inMinutes;
      return '$m minute${m == 1 ? '' : 's'} ago';
    }

    if (diff.inHours < 24) {
      final h = diff.inHours;
      return '$h hour${h == 1 ? '' : 's'} ago';
    }

    if (diff.inDays < 7) {
      final d = diff.inDays;
      return '$d day${d == 1 ? '' : 's'} ago';
    }

    if (diff.inDays < 30) {
      final w = (diff.inDays / 7).floor();
      return '$w week${w == 1 ? '' : 's'} ago';
    }

    if (diff.inDays < 365) {
      final mo = (diff.inDays / 30).floor();
      return '$mo month${mo == 1 ? '' : 's'} ago';
    }

    final y = (diff.inDays / 365).floor();
    return '$y year${y == 1 ? '' : 's'} ago';
  } catch (_) {
    return 'Just now';
  }
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required int id,
    required String message,
    required String photo,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: "created_at") required String createdAt,
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
