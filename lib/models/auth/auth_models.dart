import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class UserContainer with _$UserContainer {
  const factory UserContainer({
    @JsonKey(name: 'user') required UserProfile profile,
    String? area,
    @JsonKey(name: 'instagram_connected') bool? instagramConnected,
    @JsonKey(name: 'youtube_connected') bool? youtubeConnected,
    @JsonKey(name: 'target_audience') String? targetAudience,
    String? website,
    @JsonKey(name: 'is_following') bool? isFollowing,
    @JsonKey(name: 'is_blocking') bool? isBlocking,
    @JsonKey(name: 'is_blocker') bool? isBlocker,
  }) = _UserContainer;

  factory UserContainer.fromJson(Map<String, dynamic> json) =>
      _$UserContainerFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String name,
    required String username,
    required String email,
    String? bio,
    @JsonKey(name: 'user_type') required String userType,
    @JsonKey(name: 'profile_photo') required String profilePhoto,
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'following_count') required int followingCount,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required UserContainer user,
    required String access,
    required String refresh,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class EmptyResponse with _$EmptyResponse {
  const factory EmptyResponse() = _EmptyResponse;

  factory EmptyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmptyResponseFromJson(json);
}

class HeaderMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const HeaderMenuItem({
    required this.title,
    required this.icon,
    required this.onClick,
  });
}

class HeaderAction {
  final IconData icon;
  final String contentDescription;
  final VoidCallback onClick;
  final List<HeaderMenuItem>? menuItems;

  const HeaderAction({
    required this.icon,
    required this.contentDescription,
    this.onClick = _noop,
    this.menuItems,
  });

  static void _noop() {}
}
