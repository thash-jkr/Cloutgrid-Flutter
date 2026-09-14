// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 int get id; String get name; String get username; String get email; String get category; String get bio;@JsonKey(name: 'type') String get type;@JsonKey(name: 'profile_photo') String get profilePhoto;@JsonKey(name: 'followers_count') int get followersCount;@JsonKey(name: 'following_count') int get followingCount;@JsonKey(name: 'instagram_connected') bool? get instagramConnected;@JsonKey(name: 'youtube_connected') bool? get youtubeConnected; String? get website;@JsonKey(name: 'is_following') bool? get isFollowing;@JsonKey(name: 'is_blocking') bool? get isBlocking;@JsonKey(name: 'is_blocker') bool? get isBlocker;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.category, category) || other.category == category)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.type, type) || other.type == type)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.instagramConnected, instagramConnected) || other.instagramConnected == instagramConnected)&&(identical(other.youtubeConnected, youtubeConnected) || other.youtubeConnected == youtubeConnected)&&(identical(other.website, website) || other.website == website)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking)&&(identical(other.isBlocker, isBlocker) || other.isBlocker == isBlocker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,category,bio,type,profilePhoto,followersCount,followingCount,instagramConnected,youtubeConnected,website,isFollowing,isBlocking,isBlocker);

@override
String toString() {
  return 'UserProfile(id: $id, name: $name, username: $username, email: $email, category: $category, bio: $bio, type: $type, profilePhoto: $profilePhoto, followersCount: $followersCount, followingCount: $followingCount, instagramConnected: $instagramConnected, youtubeConnected: $youtubeConnected, website: $website, isFollowing: $isFollowing, isBlocking: $isBlocking, isBlocker: $isBlocker)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int id, String name, String username, String email, String category, String bio,@JsonKey(name: 'type') String type,@JsonKey(name: 'profile_photo') String profilePhoto,@JsonKey(name: 'followers_count') int followersCount,@JsonKey(name: 'following_count') int followingCount,@JsonKey(name: 'instagram_connected') bool? instagramConnected,@JsonKey(name: 'youtube_connected') bool? youtubeConnected, String? website,@JsonKey(name: 'is_following') bool? isFollowing,@JsonKey(name: 'is_blocking') bool? isBlocking,@JsonKey(name: 'is_blocker') bool? isBlocker
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,Object? category = null,Object? bio = null,Object? type = null,Object? profilePhoto = null,Object? followersCount = null,Object? followingCount = null,Object? instagramConnected = freezed,Object? youtubeConnected = freezed,Object? website = freezed,Object? isFollowing = freezed,Object? isBlocking = freezed,Object? isBlocker = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: null == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,instagramConnected: freezed == instagramConnected ? _self.instagramConnected : instagramConnected // ignore: cast_nullable_to_non_nullable
as bool?,youtubeConnected: freezed == youtubeConnected ? _self.youtubeConnected : youtubeConnected // ignore: cast_nullable_to_non_nullable
as bool?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,isFollowing: freezed == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool?,isBlocking: freezed == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool?,isBlocker: freezed == isBlocker ? _self.isBlocker : isBlocker // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String username,  String email,  String category,  String bio, @JsonKey(name: 'type')  String type, @JsonKey(name: 'profile_photo')  String profilePhoto, @JsonKey(name: 'followers_count')  int followersCount, @JsonKey(name: 'following_count')  int followingCount, @JsonKey(name: 'instagram_connected')  bool? instagramConnected, @JsonKey(name: 'youtube_connected')  bool? youtubeConnected,  String? website, @JsonKey(name: 'is_following')  bool? isFollowing, @JsonKey(name: 'is_blocking')  bool? isBlocking, @JsonKey(name: 'is_blocker')  bool? isBlocker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.category,_that.bio,_that.type,_that.profilePhoto,_that.followersCount,_that.followingCount,_that.instagramConnected,_that.youtubeConnected,_that.website,_that.isFollowing,_that.isBlocking,_that.isBlocker);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String username,  String email,  String category,  String bio, @JsonKey(name: 'type')  String type, @JsonKey(name: 'profile_photo')  String profilePhoto, @JsonKey(name: 'followers_count')  int followersCount, @JsonKey(name: 'following_count')  int followingCount, @JsonKey(name: 'instagram_connected')  bool? instagramConnected, @JsonKey(name: 'youtube_connected')  bool? youtubeConnected,  String? website, @JsonKey(name: 'is_following')  bool? isFollowing, @JsonKey(name: 'is_blocking')  bool? isBlocking, @JsonKey(name: 'is_blocker')  bool? isBlocker)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.name,_that.username,_that.email,_that.category,_that.bio,_that.type,_that.profilePhoto,_that.followersCount,_that.followingCount,_that.instagramConnected,_that.youtubeConnected,_that.website,_that.isFollowing,_that.isBlocking,_that.isBlocker);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String username,  String email,  String category,  String bio, @JsonKey(name: 'type')  String type, @JsonKey(name: 'profile_photo')  String profilePhoto, @JsonKey(name: 'followers_count')  int followersCount, @JsonKey(name: 'following_count')  int followingCount, @JsonKey(name: 'instagram_connected')  bool? instagramConnected, @JsonKey(name: 'youtube_connected')  bool? youtubeConnected,  String? website, @JsonKey(name: 'is_following')  bool? isFollowing, @JsonKey(name: 'is_blocking')  bool? isBlocking, @JsonKey(name: 'is_blocker')  bool? isBlocker)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.category,_that.bio,_that.type,_that.profilePhoto,_that.followersCount,_that.followingCount,_that.instagramConnected,_that.youtubeConnected,_that.website,_that.isFollowing,_that.isBlocking,_that.isBlocker);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, required this.name, required this.username, required this.email, required this.category, required this.bio, @JsonKey(name: 'type') required this.type, @JsonKey(name: 'profile_photo') required this.profilePhoto, @JsonKey(name: 'followers_count') required this.followersCount, @JsonKey(name: 'following_count') required this.followingCount, @JsonKey(name: 'instagram_connected') this.instagramConnected, @JsonKey(name: 'youtube_connected') this.youtubeConnected, this.website, @JsonKey(name: 'is_following') this.isFollowing, @JsonKey(name: 'is_blocking') this.isBlocking, @JsonKey(name: 'is_blocker') this.isBlocker});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  int id;
@override final  String name;
@override final  String username;
@override final  String email;
@override final  String category;
@override final  String bio;
@override@JsonKey(name: 'type') final  String type;
@override@JsonKey(name: 'profile_photo') final  String profilePhoto;
@override@JsonKey(name: 'followers_count') final  int followersCount;
@override@JsonKey(name: 'following_count') final  int followingCount;
@override@JsonKey(name: 'instagram_connected') final  bool? instagramConnected;
@override@JsonKey(name: 'youtube_connected') final  bool? youtubeConnected;
@override final  String? website;
@override@JsonKey(name: 'is_following') final  bool? isFollowing;
@override@JsonKey(name: 'is_blocking') final  bool? isBlocking;
@override@JsonKey(name: 'is_blocker') final  bool? isBlocker;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.category, category) || other.category == category)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.type, type) || other.type == type)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.instagramConnected, instagramConnected) || other.instagramConnected == instagramConnected)&&(identical(other.youtubeConnected, youtubeConnected) || other.youtubeConnected == youtubeConnected)&&(identical(other.website, website) || other.website == website)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking)&&(identical(other.isBlocker, isBlocker) || other.isBlocker == isBlocker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,category,bio,type,profilePhoto,followersCount,followingCount,instagramConnected,youtubeConnected,website,isFollowing,isBlocking,isBlocker);

@override
String toString() {
  return 'UserProfile(id: $id, name: $name, username: $username, email: $email, category: $category, bio: $bio, type: $type, profilePhoto: $profilePhoto, followersCount: $followersCount, followingCount: $followingCount, instagramConnected: $instagramConnected, youtubeConnected: $youtubeConnected, website: $website, isFollowing: $isFollowing, isBlocking: $isBlocking, isBlocker: $isBlocker)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String username, String email, String category, String bio,@JsonKey(name: 'type') String type,@JsonKey(name: 'profile_photo') String profilePhoto,@JsonKey(name: 'followers_count') int followersCount,@JsonKey(name: 'following_count') int followingCount,@JsonKey(name: 'instagram_connected') bool? instagramConnected,@JsonKey(name: 'youtube_connected') bool? youtubeConnected, String? website,@JsonKey(name: 'is_following') bool? isFollowing,@JsonKey(name: 'is_blocking') bool? isBlocking,@JsonKey(name: 'is_blocker') bool? isBlocker
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,Object? category = null,Object? bio = null,Object? type = null,Object? profilePhoto = null,Object? followersCount = null,Object? followingCount = null,Object? instagramConnected = freezed,Object? youtubeConnected = freezed,Object? website = freezed,Object? isFollowing = freezed,Object? isBlocking = freezed,Object? isBlocker = freezed,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: null == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,instagramConnected: freezed == instagramConnected ? _self.instagramConnected : instagramConnected // ignore: cast_nullable_to_non_nullable
as bool?,youtubeConnected: freezed == youtubeConnected ? _self.youtubeConnected : youtubeConnected // ignore: cast_nullable_to_non_nullable
as bool?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,isFollowing: freezed == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool?,isBlocking: freezed == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool?,isBlocker: freezed == isBlocker ? _self.isBlocker : isBlocker // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$LoginResponse {

 UserProfile get user; String get access; String get refresh;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,access,refresh);

@override
String toString() {
  return 'LoginResponse(user: $user, access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 UserProfile user, String access, String refresh
});


$UserProfileCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? access = null,Object? refresh = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfile,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get user {
  
  return $UserProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile user,  String access,  String refresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.user,_that.access,_that.refresh);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile user,  String access,  String refresh)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.user,_that.access,_that.refresh);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile user,  String access,  String refresh)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.user,_that.access,_that.refresh);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.user, required this.access, required this.refresh});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  UserProfile user;
@override final  String access;
@override final  String refresh;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,access,refresh);

@override
String toString() {
  return 'LoginResponse(user: $user, access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 UserProfile user, String access, String refresh
});


@override $UserProfileCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? access = null,Object? refresh = null,}) {
  return _then(_LoginResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfile,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get user {
  
  return $UserProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$EmptyResponse {



  /// Serializes this EmptyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyResponse);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmptyResponse()';
}


}

/// @nodoc
class $EmptyResponseCopyWith<$Res>  {
$EmptyResponseCopyWith(EmptyResponse _, $Res Function(EmptyResponse) __);
}


/// Adds pattern-matching-related methods to [EmptyResponse].
extension EmptyResponsePatterns on EmptyResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmptyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmptyResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmptyResponse value)  $default,){
final _that = this;
switch (_that) {
case _EmptyResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmptyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EmptyResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmptyResponse() when $default != null:
return $default();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _EmptyResponse():
return $default();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _EmptyResponse() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmptyResponse implements EmptyResponse {
  const _EmptyResponse();
  factory _EmptyResponse.fromJson(Map<String, dynamic> json) => _$EmptyResponseFromJson(json);




@override
Map<String, dynamic> toJson() {
  return _$EmptyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyResponse);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmptyResponse()';
}


}




// dart format on
