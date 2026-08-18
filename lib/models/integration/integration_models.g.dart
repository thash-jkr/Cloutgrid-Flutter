// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InstagramPageModel _$InstagramPageModelFromJson(Map<String, dynamic> json) =>
    _InstagramPageModel(
      id: (json['id'] as num).toInt(),
      igUserId: json['ig_user_id'] as String,
      username: json['username'] as String,
      profilePicture: json['profile_picture_url'] as String,
      followers: (json['followers'] as num).toInt(),
      followings: (json['followings'] as num).toInt(),
      mediaCount: (json['media_count'] as num).toInt(),
      insights: (json['insights_raw'] as List<dynamic>)
          .map((e) => ProfileInsightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstagramPageModelToJson(_InstagramPageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ig_user_id': instance.igUserId,
      'username': instance.username,
      'profile_picture_url': instance.profilePicture,
      'followers': instance.followers,
      'followings': instance.followings,
      'media_count': instance.mediaCount,
      'insights_raw': instance.insights,
    };

_InsightValue _$InsightValueFromJson(Map<String, dynamic> json) =>
    _InsightValue(value: (json['value'] as num).toInt());

Map<String, dynamic> _$InsightValueToJson(_InsightValue instance) =>
    <String, dynamic>{'value': instance.value};

_ProfileInsightModel _$ProfileInsightModelFromJson(Map<String, dynamic> json) =>
    _ProfileInsightModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      totalValue: InsightValue.fromJson(
        json['total_value'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProfileInsightModelToJson(
  _ProfileInsightModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'title': instance.title,
  'period': instance.period,
  'description': instance.description,
  'total_value': instance.totalValue,
};

_InstagramMediaModel _$InstagramMediaModelFromJson(Map<String, dynamic> json) =>
    _InstagramMediaModel(
      id: (json['id'] as num).toInt(),
      owner: (json['owner'] as num).toInt(),
      mediaId: json['media_id'] as String,
      mediaType: json['media_type'] as String,
      mediaUrl: json['media_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      link: json['link'] as String,
      caption: json['caption'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      insights: (json['insights_raw'] as List<dynamic>)
          .map((e) => MediaInsightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstagramMediaModelToJson(
  _InstagramMediaModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'owner': instance.owner,
  'media_id': instance.mediaId,
  'media_type': instance.mediaType,
  'media_url': instance.mediaUrl,
  'thumbnail_url': instance.thumbnailUrl,
  'link': instance.link,
  'caption': instance.caption,
  'like_count': instance.likeCount,
  'comments_count': instance.commentsCount,
  'insights_raw': instance.insights,
};

_MediaInsightModel _$MediaInsightModelFromJson(Map<String, dynamic> json) =>
    _MediaInsightModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => InsightValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaInsightModelToJson(_MediaInsightModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'period': instance.period,
      'description': instance.description,
      'values': instance.values,
    };

_YoutubeChannelModel _$YoutubeChannelModelFromJson(Map<String, dynamic> json) =>
    _YoutubeChannelModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      channelId: json['channel_id'] as String,
      description: json['description'] as String,
      profilePicture: json['profile_picture_url'] as String,
      banner: json['banner_url'] as String,
      subscriberCount: (json['subscriber_count'] as num).toInt(),
      viewCount: (json['view_count'] as num).toInt(),
      videoCount: (json['video_count'] as num).toInt(),
    );

Map<String, dynamic> _$YoutubeChannelModelToJson(
  _YoutubeChannelModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'channel_id': instance.channelId,
  'description': instance.description,
  'profile_picture_url': instance.profilePicture,
  'banner_url': instance.banner,
  'subscriber_count': instance.subscriberCount,
  'view_count': instance.viewCount,
  'video_count': instance.videoCount,
};

_YoutubeMediaModel _$YoutubeMediaModelFromJson(Map<String, dynamic> json) =>
    _YoutubeMediaModel(
      id: (json['id'] as num).toInt(),
      mediaId: json['media_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail_url'] as String,
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
    );

Map<String, dynamic> _$YoutubeMediaModelToJson(_YoutubeMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_id': instance.mediaId,
      'title': instance.title,
      'description': instance.description,
      'thumbnail_url': instance.thumbnail,
      'views': instance.views,
      'likes': instance.likes,
      'comments': instance.comments,
    };

_InstagramResponseModel _$InstagramResponseModelFromJson(
  Map<String, dynamic> json,
) => _InstagramResponseModel(
  fbPage: json['fb_page'] as String,
  igPage: json['ig_page'] as String,
);

Map<String, dynamic> _$InstagramResponseModelToJson(
  _InstagramResponseModel instance,
) => <String, dynamic>{'fb_page': instance.fbPage, 'ig_page': instance.igPage};

_InstagramPageResponse _$InstagramPageResponseFromJson(
  Map<String, dynamic> json,
) => _InstagramPageResponse(
  profileData: InstagramPageModel.fromJson(
    json['profile_data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$InstagramPageResponseToJson(
  _InstagramPageResponse instance,
) => <String, dynamic>{'profile_data': instance.profileData};

_InstagramMediaResponse _$InstagramMediaResponseFromJson(
  Map<String, dynamic> json,
) => _InstagramMediaResponse(
  media: (json['media'] as List<dynamic>)
      .map((e) => InstagramMediaModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InstagramMediaResponseToJson(
  _InstagramMediaResponse instance,
) => <String, dynamic>{'media': instance.media};

_YoutubeChannelResponse _$YoutubeChannelResponseFromJson(
  Map<String, dynamic> json,
) => _YoutubeChannelResponse(
  channelData: YoutubeChannelModel.fromJson(
    json['channel_data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$YoutubeChannelResponseToJson(
  _YoutubeChannelResponse instance,
) => <String, dynamic>{'channel_data': instance.channelData};

_YoutubeMediaResponse _$YoutubeMediaResponseFromJson(
  Map<String, dynamic> json,
) => _YoutubeMediaResponse(
  data: (json['media_data'] as List<dynamic>)
      .map((e) => YoutubeMediaModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$YoutubeMediaResponseToJson(
  _YoutubeMediaResponse instance,
) => <String, dynamic>{'media_data': instance.data};
