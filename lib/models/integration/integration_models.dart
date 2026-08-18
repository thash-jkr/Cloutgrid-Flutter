import 'package:freezed_annotation/freezed_annotation.dart';

part 'integration_models.freezed.dart';
part 'integration_models.g.dart';

@freezed
abstract class InstagramPageModel with _$InstagramPageModel {
  const factory InstagramPageModel({
    required int id,
    @JsonKey(name: 'ig_user_id') required String igUserId,
    required String username,
    @JsonKey(name: 'profile_picture_url') required String profilePicture,
    required int followers,
    required int followings,
    @JsonKey(name: 'media_count') required int mediaCount,
    @JsonKey(name: 'insights_raw') required List<ProfileInsightModel> insights,
  }) = _InstagramPageModel;

  factory InstagramPageModel.fromJson(Map<String, dynamic> json) =>
      _$InstagramPageModelFromJson(json);
}

/// Kotlin's InsightValue had a `val id: String get() = UUID.randomUUID()...`
/// — a computed getter returning a NEW random value on every access, not a
/// stable id (same footgun flagged on UserContainer earlier). Dropped here;
/// use list index for widget Keys when rendering these instead.
@freezed
abstract class InsightValue with _$InsightValue {
  const factory InsightValue({required int value}) = _InsightValue;

  factory InsightValue.fromJson(Map<String, dynamic> json) =>
      _$InsightValueFromJson(json);
}

@freezed
abstract class ProfileInsightModel with _$ProfileInsightModel {
  const factory ProfileInsightModel({
    required String id,
    required String name,
    required String title,
    required String period,
    required String description,
    @JsonKey(name: 'total_value') required InsightValue totalValue,
  }) = _ProfileInsightModel;

  factory ProfileInsightModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileInsightModelFromJson(json);
}

@freezed
abstract class InstagramMediaModel with _$InstagramMediaModel {
  const factory InstagramMediaModel({
    required int id,
    required int owner,
    @JsonKey(name: 'media_id') required String mediaId,
    @JsonKey(name: 'media_type') required String mediaType,
    @JsonKey(name: 'media_url') required String mediaUrl,
    @JsonKey(name: 'thumbnail_url') required String thumbnailUrl,
    required String link,
    required String caption,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'comments_count') required int commentsCount,
    @JsonKey(name: 'insights_raw') required List<MediaInsightModel> insights,
  }) = _InstagramMediaModel;

  factory InstagramMediaModel.fromJson(Map<String, dynamic> json) =>
      _$InstagramMediaModelFromJson(json);
}

@freezed
abstract class MediaInsightModel with _$MediaInsightModel {
  const factory MediaInsightModel({
    required String id,
    required String name,
    required String title,
    required String period,
    required String description,
    required List<InsightValue> values,
  }) = _MediaInsightModel;

  factory MediaInsightModel.fromJson(Map<String, dynamic> json) =>
      _$MediaInsightModelFromJson(json);
}

@freezed
abstract class YoutubeChannelModel with _$YoutubeChannelModel {
  const factory YoutubeChannelModel({
    required int id,
    required String title,
    @JsonKey(name: 'channel_id') required String channelId,
    required String description,
    @JsonKey(name: 'profile_picture_url') required String profilePicture,
    @JsonKey(name: 'banner_url') required String banner,
    @JsonKey(name: 'subscriber_count') required int subscriberCount,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'video_count') required int videoCount,
  }) = _YoutubeChannelModel;

  factory YoutubeChannelModel.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelModelFromJson(json);
}

@freezed
abstract class YoutubeMediaModel with _$YoutubeMediaModel {
  const factory YoutubeMediaModel({
    required int id,
    @JsonKey(name: 'media_id') required String mediaId,
    required String title,
    required String description,
    @JsonKey(name: 'thumbnail_url') required String thumbnail,
    required int views,
    required int likes,
    required int comments,
  }) = _YoutubeMediaModel;

  factory YoutubeMediaModel.fromJson(Map<String, dynamic> json) =>
      _$YoutubeMediaModelFromJson(json);
}

@freezed
abstract class InstagramResponseModel with _$InstagramResponseModel {
  const factory InstagramResponseModel({
    @JsonKey(name: 'fb_page') required String fbPage,
    @JsonKey(name: 'ig_page') required String igPage,
  }) = _InstagramResponseModel;

  factory InstagramResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InstagramResponseModelFromJson(json);
}

@freezed
abstract class InstagramPageResponse with _$InstagramPageResponse {
  const factory InstagramPageResponse({
    @JsonKey(name: 'profile_data') required InstagramPageModel profileData,
  }) = _InstagramPageResponse;

  factory InstagramPageResponse.fromJson(Map<String, dynamic> json) =>
      _$InstagramPageResponseFromJson(json);
}

@freezed
abstract class InstagramMediaResponse with _$InstagramMediaResponse {
  const factory InstagramMediaResponse({
    required List<InstagramMediaModel> media,
  }) = _InstagramMediaResponse;

  factory InstagramMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$InstagramMediaResponseFromJson(json);
}

@freezed
abstract class YoutubeChannelResponse with _$YoutubeChannelResponse {
  const factory YoutubeChannelResponse({
    @JsonKey(name: 'channel_data') required YoutubeChannelModel channelData,
  }) = _YoutubeChannelResponse;

  factory YoutubeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelResponseFromJson(json);
}

@freezed
abstract class YoutubeMediaResponse with _$YoutubeMediaResponse {
  const factory YoutubeMediaResponse({
    @JsonKey(name: 'media_data') required List<YoutubeMediaModel> data,
  }) = _YoutubeMediaResponse;

  factory YoutubeMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeMediaResponseFromJson(json);
}
