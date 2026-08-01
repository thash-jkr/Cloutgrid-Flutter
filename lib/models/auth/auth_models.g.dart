// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserContainer _$UserContainerFromJson(Map<String, dynamic> json) =>
    _UserContainer(
      profile: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      area: json['area'] as String?,
      instagramConnected: json['instagram_connected'] as bool?,
      youtubeConnected: json['youtube_connected'] as bool?,
      targetAudience: json['target_audience'] as String?,
      website: json['website'] as String?,
      isFollowing: json['is_following'] as bool?,
      isBlocking: json['is_blocking'] as bool?,
      isBlocker: json['is_blocker'] as bool?,
    );

Map<String, dynamic> _$UserContainerToJson(_UserContainer instance) =>
    <String, dynamic>{
      'user': instance.profile,
      'area': instance.area,
      'instagram_connected': instance.instagramConnected,
      'youtube_connected': instance.youtubeConnected,
      'target_audience': instance.targetAudience,
      'website': instance.website,
      'is_following': instance.isFollowing,
      'is_blocking': instance.isBlocking,
      'is_blocker': instance.isBlocker,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  bio: json['bio'] as String?,
  userType: json['user_type'] as String,
  profilePhoto: json['profile_photo'] as String,
  followersCount: (json['followers_count'] as num).toInt(),
  followingCount: (json['following_count'] as num).toInt(),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'bio': instance.bio,
      'user_type': instance.userType,
      'profile_photo': instance.profilePhoto,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
    };

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      user: UserContainer.fromJson(json['user'] as Map<String, dynamic>),
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access': instance.access,
      'refresh': instance.refresh,
    };

_EmptyResponse _$EmptyResponseFromJson(Map<String, dynamic> json) =>
    _EmptyResponse();

Map<String, dynamic> _$EmptyResponseToJson(_EmptyResponse instance) =>
    <String, dynamic>{};
