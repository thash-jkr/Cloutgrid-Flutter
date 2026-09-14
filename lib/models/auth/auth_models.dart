import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String name,
    required String username,
    required String email,
    required String category,
    required String bio,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'profile_photo') required String profilePhoto,
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'following_count') required int followingCount,
    @JsonKey(name: 'instagram_connected') bool? instagramConnected,
    @JsonKey(name: 'youtube_connected') bool? youtubeConnected,
    String? website,
    @JsonKey(name: 'is_following') bool? isFollowing,
    @JsonKey(name: 'is_blocking') bool? isBlocking,
    @JsonKey(name: 'is_blocker') bool? isBlocker,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required UserProfile user,
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
  final IconData? icon;
  final ImageProvider? image;
  final String contentDescription;
  final VoidCallback onClick;
  final List<HeaderMenuItem>? menuItems;
  final bool disabled;

  const HeaderAction({
    this.icon,
    this.image,
    required this.contentDescription,
    this.onClick = _noop,
    this.menuItems,
    this.disabled = false,
  });

  static void _noop() {}
}
