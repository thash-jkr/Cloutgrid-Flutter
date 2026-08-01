// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {

 int get id; String get message;@JsonKey(name: 'is_read') bool get isRead;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,isRead);

@override
String toString() {
  return 'NotificationModel(id: $id, message: $message, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 int id, String message,@JsonKey(name: 'is_read') bool isRead
});




}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? isRead = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String message, @JsonKey(name: 'is_read')  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.message,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String message, @JsonKey(name: 'is_read')  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.message,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String message, @JsonKey(name: 'is_read')  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.message,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
  const _NotificationModel({required this.id, required this.message, @JsonKey(name: 'is_read') required this.isRead});
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  int id;
@override final  String message;
@override@JsonKey(name: 'is_read') final  bool isRead;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,isRead);

@override
String toString() {
  return 'NotificationModel(id: $id, message: $message, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String message,@JsonKey(name: 'is_read') bool isRead
});




}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? isRead = null,}) {
  return _then(_NotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PostModel {

 int get id; UserProfile get author;@JsonKey(name: 'posted_by') UserContainer get postedBy; UserContainer? get collaboration;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'comment_count') int get commentCount;@JsonKey(name: 'is_liked') bool get isLiked; String get image; String get caption;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.postedBy, postedBy) || other.postedBy == postedBy)&&(identical(other.collaboration, collaboration) || other.collaboration == collaboration)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.image, image) || other.image == image)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,postedBy,collaboration,likeCount,commentCount,isLiked,image,caption);

@override
String toString() {
  return 'PostModel(id: $id, author: $author, postedBy: $postedBy, collaboration: $collaboration, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked, image: $image, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 int id, UserProfile author,@JsonKey(name: 'posted_by') UserContainer postedBy, UserContainer? collaboration,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'is_liked') bool isLiked, String image, String caption
});


$UserProfileCopyWith<$Res> get author;$UserContainerCopyWith<$Res> get postedBy;$UserContainerCopyWith<$Res>? get collaboration;

}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? postedBy = null,Object? collaboration = freezed,Object? likeCount = null,Object? commentCount = null,Object? isLiked = null,Object? image = null,Object? caption = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as UserProfile,postedBy: null == postedBy ? _self.postedBy : postedBy // ignore: cast_nullable_to_non_nullable
as UserContainer,collaboration: freezed == collaboration ? _self.collaboration : collaboration // ignore: cast_nullable_to_non_nullable
as UserContainer?,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get author {
  
  return $UserProfileCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContainerCopyWith<$Res> get postedBy {
  
  return $UserContainerCopyWith<$Res>(_self.postedBy, (value) {
    return _then(_self.copyWith(postedBy: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContainerCopyWith<$Res>? get collaboration {
    if (_self.collaboration == null) {
    return null;
  }

  return $UserContainerCopyWith<$Res>(_self.collaboration!, (value) {
    return _then(_self.copyWith(collaboration: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostModel].
extension PostModelPatterns on PostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostModel value)  $default,){
final _that = this;
switch (_that) {
case _PostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  UserProfile author, @JsonKey(name: 'posted_by')  UserContainer postedBy,  UserContainer? collaboration, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'is_liked')  bool isLiked,  String image,  String caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.author,_that.postedBy,_that.collaboration,_that.likeCount,_that.commentCount,_that.isLiked,_that.image,_that.caption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  UserProfile author, @JsonKey(name: 'posted_by')  UserContainer postedBy,  UserContainer? collaboration, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'is_liked')  bool isLiked,  String image,  String caption)  $default,) {final _that = this;
switch (_that) {
case _PostModel():
return $default(_that.id,_that.author,_that.postedBy,_that.collaboration,_that.likeCount,_that.commentCount,_that.isLiked,_that.image,_that.caption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  UserProfile author, @JsonKey(name: 'posted_by')  UserContainer postedBy,  UserContainer? collaboration, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'is_liked')  bool isLiked,  String image,  String caption)?  $default,) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.author,_that.postedBy,_that.collaboration,_that.likeCount,_that.commentCount,_that.isLiked,_that.image,_that.caption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostModel implements PostModel {
  const _PostModel({required this.id, required this.author, @JsonKey(name: 'posted_by') required this.postedBy, this.collaboration, @JsonKey(name: 'like_count') required this.likeCount, @JsonKey(name: 'comment_count') required this.commentCount, @JsonKey(name: 'is_liked') required this.isLiked, required this.image, required this.caption});
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override final  int id;
@override final  UserProfile author;
@override@JsonKey(name: 'posted_by') final  UserContainer postedBy;
@override final  UserContainer? collaboration;
@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'comment_count') final  int commentCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override final  String image;
@override final  String caption;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.postedBy, postedBy) || other.postedBy == postedBy)&&(identical(other.collaboration, collaboration) || other.collaboration == collaboration)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.image, image) || other.image == image)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,postedBy,collaboration,likeCount,commentCount,isLiked,image,caption);

@override
String toString() {
  return 'PostModel(id: $id, author: $author, postedBy: $postedBy, collaboration: $collaboration, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked, image: $image, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 int id, UserProfile author,@JsonKey(name: 'posted_by') UserContainer postedBy, UserContainer? collaboration,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'is_liked') bool isLiked, String image, String caption
});


@override $UserProfileCopyWith<$Res> get author;@override $UserContainerCopyWith<$Res> get postedBy;@override $UserContainerCopyWith<$Res>? get collaboration;

}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? postedBy = null,Object? collaboration = freezed,Object? likeCount = null,Object? commentCount = null,Object? isLiked = null,Object? image = null,Object? caption = null,}) {
  return _then(_PostModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as UserProfile,postedBy: null == postedBy ? _self.postedBy : postedBy // ignore: cast_nullable_to_non_nullable
as UserContainer,collaboration: freezed == collaboration ? _self.collaboration : collaboration // ignore: cast_nullable_to_non_nullable
as UserContainer?,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get author {
  
  return $UserProfileCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContainerCopyWith<$Res> get postedBy {
  
  return $UserContainerCopyWith<$Res>(_self.postedBy, (value) {
    return _then(_self.copyWith(postedBy: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserContainerCopyWith<$Res>? get collaboration {
    if (_self.collaboration == null) {
    return null;
  }

  return $UserContainerCopyWith<$Res>(_self.collaboration!, (value) {
    return _then(_self.copyWith(collaboration: value));
  });
}
}


/// @nodoc
mixin _$CommentModel {

 int get id; UserProfile get user; String get content;@JsonKey(name: 'commented_at') String get commentedAt;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&(identical(other.commentedAt, commentedAt) || other.commentedAt == commentedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,commentedAt);

@override
String toString() {
  return 'CommentModel(id: $id, user: $user, content: $content, commentedAt: $commentedAt)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
 int id, UserProfile user, String content,@JsonKey(name: 'commented_at') String commentedAt
});


$UserProfileCopyWith<$Res> get user;

}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? content = null,Object? commentedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfile,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,commentedAt: null == commentedAt ? _self.commentedAt : commentedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get user {
  
  return $UserProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommentModel].
extension CommentModelPatterns on CommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  UserProfile user,  String content, @JsonKey(name: 'commented_at')  String commentedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.commentedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  UserProfile user,  String content, @JsonKey(name: 'commented_at')  String commentedAt)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.id,_that.user,_that.content,_that.commentedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  UserProfile user,  String content, @JsonKey(name: 'commented_at')  String commentedAt)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.commentedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel extends CommentModel {
  const _CommentModel({required this.id, required this.user, required this.content, @JsonKey(name: 'commented_at') required this.commentedAt}): super._();
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override final  int id;
@override final  UserProfile user;
@override final  String content;
@override@JsonKey(name: 'commented_at') final  String commentedAt;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&(identical(other.commentedAt, commentedAt) || other.commentedAt == commentedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,commentedAt);

@override
String toString() {
  return 'CommentModel(id: $id, user: $user, content: $content, commentedAt: $commentedAt)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, UserProfile user, String content,@JsonKey(name: 'commented_at') String commentedAt
});


@override $UserProfileCopyWith<$Res> get user;

}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? content = null,Object? commentedAt = null,}) {
  return _then(_CommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfile,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,commentedAt: null == commentedAt ? _self.commentedAt : commentedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CommentModel
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
mixin _$LikeResponse {

 bool get liked;@JsonKey(name: 'like_count') int get likeCount;
/// Create a copy of LikeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeResponseCopyWith<LikeResponse> get copyWith => _$LikeResponseCopyWithImpl<LikeResponse>(this as LikeResponse, _$identity);

  /// Serializes this LikeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeResponse&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,liked,likeCount);

@override
String toString() {
  return 'LikeResponse(liked: $liked, likeCount: $likeCount)';
}


}

/// @nodoc
abstract mixin class $LikeResponseCopyWith<$Res>  {
  factory $LikeResponseCopyWith(LikeResponse value, $Res Function(LikeResponse) _then) = _$LikeResponseCopyWithImpl;
@useResult
$Res call({
 bool liked,@JsonKey(name: 'like_count') int likeCount
});




}
/// @nodoc
class _$LikeResponseCopyWithImpl<$Res>
    implements $LikeResponseCopyWith<$Res> {
  _$LikeResponseCopyWithImpl(this._self, this._then);

  final LikeResponse _self;
  final $Res Function(LikeResponse) _then;

/// Create a copy of LikeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? liked = null,Object? likeCount = null,}) {
  return _then(_self.copyWith(
liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeResponse].
extension LikeResponsePatterns on LikeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeResponse value)  $default,){
final _that = this;
switch (_that) {
case _LikeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LikeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool liked, @JsonKey(name: 'like_count')  int likeCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeResponse() when $default != null:
return $default(_that.liked,_that.likeCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool liked, @JsonKey(name: 'like_count')  int likeCount)  $default,) {final _that = this;
switch (_that) {
case _LikeResponse():
return $default(_that.liked,_that.likeCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool liked, @JsonKey(name: 'like_count')  int likeCount)?  $default,) {final _that = this;
switch (_that) {
case _LikeResponse() when $default != null:
return $default(_that.liked,_that.likeCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LikeResponse implements LikeResponse {
  const _LikeResponse({required this.liked, @JsonKey(name: 'like_count') required this.likeCount});
  factory _LikeResponse.fromJson(Map<String, dynamic> json) => _$LikeResponseFromJson(json);

@override final  bool liked;
@override@JsonKey(name: 'like_count') final  int likeCount;

/// Create a copy of LikeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeResponseCopyWith<_LikeResponse> get copyWith => __$LikeResponseCopyWithImpl<_LikeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeResponse&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,liked,likeCount);

@override
String toString() {
  return 'LikeResponse(liked: $liked, likeCount: $likeCount)';
}


}

/// @nodoc
abstract mixin class _$LikeResponseCopyWith<$Res> implements $LikeResponseCopyWith<$Res> {
  factory _$LikeResponseCopyWith(_LikeResponse value, $Res Function(_LikeResponse) _then) = __$LikeResponseCopyWithImpl;
@override @useResult
$Res call({
 bool liked,@JsonKey(name: 'like_count') int likeCount
});




}
/// @nodoc
class __$LikeResponseCopyWithImpl<$Res>
    implements _$LikeResponseCopyWith<$Res> {
  __$LikeResponseCopyWithImpl(this._self, this._then);

  final _LikeResponse _self;
  final $Res Function(_LikeResponse) _then;

/// Create a copy of LikeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? liked = null,Object? likeCount = null,}) {
  return _then(_LikeResponse(
liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PostResponse {

 List<PostModel> get results; String? get next;
/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostResponseCopyWith<PostResponse> get copyWith => _$PostResponseCopyWithImpl<PostResponse>(this as PostResponse, _$identity);

  /// Serializes this PostResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostResponse&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),next);

@override
String toString() {
  return 'PostResponse(results: $results, next: $next)';
}


}

/// @nodoc
abstract mixin class $PostResponseCopyWith<$Res>  {
  factory $PostResponseCopyWith(PostResponse value, $Res Function(PostResponse) _then) = _$PostResponseCopyWithImpl;
@useResult
$Res call({
 List<PostModel> results, String? next
});




}
/// @nodoc
class _$PostResponseCopyWithImpl<$Res>
    implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._self, this._then);

  final PostResponse _self;
  final $Res Function(PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? next = freezed,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PostModel>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostResponse].
extension PostResponsePatterns on PostResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostModel> results,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.results,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostModel> results,  String? next)  $default,) {final _that = this;
switch (_that) {
case _PostResponse():
return $default(_that.results,_that.next);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostModel> results,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.results,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostResponse implements PostResponse {
  const _PostResponse({required final  List<PostModel> results, this.next}): _results = results;
  factory _PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

 final  List<PostModel> _results;
@override List<PostModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  String? next;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostResponseCopyWith<_PostResponse> get copyWith => __$PostResponseCopyWithImpl<_PostResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostResponse&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),next);

@override
String toString() {
  return 'PostResponse(results: $results, next: $next)';
}


}

/// @nodoc
abstract mixin class _$PostResponseCopyWith<$Res> implements $PostResponseCopyWith<$Res> {
  factory _$PostResponseCopyWith(_PostResponse value, $Res Function(_PostResponse) _then) = __$PostResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PostModel> results, String? next
});




}
/// @nodoc
class __$PostResponseCopyWithImpl<$Res>
    implements _$PostResponseCopyWith<$Res> {
  __$PostResponseCopyWithImpl(this._self, this._then);

  final _PostResponse _self;
  final $Res Function(_PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? next = freezed,}) {
  return _then(_PostResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PostModel>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
