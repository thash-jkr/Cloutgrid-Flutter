// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'integration_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InstagramPageModel {

 int get id;@JsonKey(name: 'ig_user_id') String get igUserId; String get username;@JsonKey(name: 'profile_picture_url') String get profilePicture; int get followers; int get followings;@JsonKey(name: 'media_count') int get mediaCount;@JsonKey(name: 'insights_raw') List<ProfileInsightModel> get insights;
/// Create a copy of InstagramPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstagramPageModelCopyWith<InstagramPageModel> get copyWith => _$InstagramPageModelCopyWithImpl<InstagramPageModel>(this as InstagramPageModel, _$identity);

  /// Serializes this InstagramPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstagramPageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.igUserId, igUserId) || other.igUserId == igUserId)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.followings, followings) || other.followings == followings)&&(identical(other.mediaCount, mediaCount) || other.mediaCount == mediaCount)&&const DeepCollectionEquality().equals(other.insights, insights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,igUserId,username,profilePicture,followers,followings,mediaCount,const DeepCollectionEquality().hash(insights));

@override
String toString() {
  return 'InstagramPageModel(id: $id, igUserId: $igUserId, username: $username, profilePicture: $profilePicture, followers: $followers, followings: $followings, mediaCount: $mediaCount, insights: $insights)';
}


}

/// @nodoc
abstract mixin class $InstagramPageModelCopyWith<$Res>  {
  factory $InstagramPageModelCopyWith(InstagramPageModel value, $Res Function(InstagramPageModel) _then) = _$InstagramPageModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'ig_user_id') String igUserId, String username,@JsonKey(name: 'profile_picture_url') String profilePicture, int followers, int followings,@JsonKey(name: 'media_count') int mediaCount,@JsonKey(name: 'insights_raw') List<ProfileInsightModel> insights
});




}
/// @nodoc
class _$InstagramPageModelCopyWithImpl<$Res>
    implements $InstagramPageModelCopyWith<$Res> {
  _$InstagramPageModelCopyWithImpl(this._self, this._then);

  final InstagramPageModel _self;
  final $Res Function(InstagramPageModel) _then;

/// Create a copy of InstagramPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? igUserId = null,Object? username = null,Object? profilePicture = null,Object? followers = null,Object? followings = null,Object? mediaCount = null,Object? insights = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,igUserId: null == igUserId ? _self.igUserId : igUserId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,followings: null == followings ? _self.followings : followings // ignore: cast_nullable_to_non_nullable
as int,mediaCount: null == mediaCount ? _self.mediaCount : mediaCount // ignore: cast_nullable_to_non_nullable
as int,insights: null == insights ? _self.insights : insights // ignore: cast_nullable_to_non_nullable
as List<ProfileInsightModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [InstagramPageModel].
extension InstagramPageModelPatterns on InstagramPageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstagramPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstagramPageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstagramPageModel value)  $default,){
final _that = this;
switch (_that) {
case _InstagramPageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstagramPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _InstagramPageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'ig_user_id')  String igUserId,  String username, @JsonKey(name: 'profile_picture_url')  String profilePicture,  int followers,  int followings, @JsonKey(name: 'media_count')  int mediaCount, @JsonKey(name: 'insights_raw')  List<ProfileInsightModel> insights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstagramPageModel() when $default != null:
return $default(_that.id,_that.igUserId,_that.username,_that.profilePicture,_that.followers,_that.followings,_that.mediaCount,_that.insights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'ig_user_id')  String igUserId,  String username, @JsonKey(name: 'profile_picture_url')  String profilePicture,  int followers,  int followings, @JsonKey(name: 'media_count')  int mediaCount, @JsonKey(name: 'insights_raw')  List<ProfileInsightModel> insights)  $default,) {final _that = this;
switch (_that) {
case _InstagramPageModel():
return $default(_that.id,_that.igUserId,_that.username,_that.profilePicture,_that.followers,_that.followings,_that.mediaCount,_that.insights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'ig_user_id')  String igUserId,  String username, @JsonKey(name: 'profile_picture_url')  String profilePicture,  int followers,  int followings, @JsonKey(name: 'media_count')  int mediaCount, @JsonKey(name: 'insights_raw')  List<ProfileInsightModel> insights)?  $default,) {final _that = this;
switch (_that) {
case _InstagramPageModel() when $default != null:
return $default(_that.id,_that.igUserId,_that.username,_that.profilePicture,_that.followers,_that.followings,_that.mediaCount,_that.insights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstagramPageModel implements InstagramPageModel {
  const _InstagramPageModel({required this.id, @JsonKey(name: 'ig_user_id') required this.igUserId, required this.username, @JsonKey(name: 'profile_picture_url') required this.profilePicture, required this.followers, required this.followings, @JsonKey(name: 'media_count') required this.mediaCount, @JsonKey(name: 'insights_raw') required final  List<ProfileInsightModel> insights}): _insights = insights;
  factory _InstagramPageModel.fromJson(Map<String, dynamic> json) => _$InstagramPageModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'ig_user_id') final  String igUserId;
@override final  String username;
@override@JsonKey(name: 'profile_picture_url') final  String profilePicture;
@override final  int followers;
@override final  int followings;
@override@JsonKey(name: 'media_count') final  int mediaCount;
 final  List<ProfileInsightModel> _insights;
@override@JsonKey(name: 'insights_raw') List<ProfileInsightModel> get insights {
  if (_insights is EqualUnmodifiableListView) return _insights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insights);
}


/// Create a copy of InstagramPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstagramPageModelCopyWith<_InstagramPageModel> get copyWith => __$InstagramPageModelCopyWithImpl<_InstagramPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstagramPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstagramPageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.igUserId, igUserId) || other.igUserId == igUserId)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.followings, followings) || other.followings == followings)&&(identical(other.mediaCount, mediaCount) || other.mediaCount == mediaCount)&&const DeepCollectionEquality().equals(other._insights, _insights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,igUserId,username,profilePicture,followers,followings,mediaCount,const DeepCollectionEquality().hash(_insights));

@override
String toString() {
  return 'InstagramPageModel(id: $id, igUserId: $igUserId, username: $username, profilePicture: $profilePicture, followers: $followers, followings: $followings, mediaCount: $mediaCount, insights: $insights)';
}


}

/// @nodoc
abstract mixin class _$InstagramPageModelCopyWith<$Res> implements $InstagramPageModelCopyWith<$Res> {
  factory _$InstagramPageModelCopyWith(_InstagramPageModel value, $Res Function(_InstagramPageModel) _then) = __$InstagramPageModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'ig_user_id') String igUserId, String username,@JsonKey(name: 'profile_picture_url') String profilePicture, int followers, int followings,@JsonKey(name: 'media_count') int mediaCount,@JsonKey(name: 'insights_raw') List<ProfileInsightModel> insights
});




}
/// @nodoc
class __$InstagramPageModelCopyWithImpl<$Res>
    implements _$InstagramPageModelCopyWith<$Res> {
  __$InstagramPageModelCopyWithImpl(this._self, this._then);

  final _InstagramPageModel _self;
  final $Res Function(_InstagramPageModel) _then;

/// Create a copy of InstagramPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? igUserId = null,Object? username = null,Object? profilePicture = null,Object? followers = null,Object? followings = null,Object? mediaCount = null,Object? insights = null,}) {
  return _then(_InstagramPageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,igUserId: null == igUserId ? _self.igUserId : igUserId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,followings: null == followings ? _self.followings : followings // ignore: cast_nullable_to_non_nullable
as int,mediaCount: null == mediaCount ? _self.mediaCount : mediaCount // ignore: cast_nullable_to_non_nullable
as int,insights: null == insights ? _self._insights : insights // ignore: cast_nullable_to_non_nullable
as List<ProfileInsightModel>,
  ));
}


}


/// @nodoc
mixin _$InsightValue {

 int get value;
/// Create a copy of InsightValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsightValueCopyWith<InsightValue> get copyWith => _$InsightValueCopyWithImpl<InsightValue>(this as InsightValue, _$identity);

  /// Serializes this InsightValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightValue&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InsightValue(value: $value)';
}


}

/// @nodoc
abstract mixin class $InsightValueCopyWith<$Res>  {
  factory $InsightValueCopyWith(InsightValue value, $Res Function(InsightValue) _then) = _$InsightValueCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class _$InsightValueCopyWithImpl<$Res>
    implements $InsightValueCopyWith<$Res> {
  _$InsightValueCopyWithImpl(this._self, this._then);

  final InsightValue _self;
  final $Res Function(InsightValue) _then;

/// Create a copy of InsightValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InsightValue].
extension InsightValuePatterns on InsightValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsightValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsightValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsightValue value)  $default,){
final _that = this;
switch (_that) {
case _InsightValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsightValue value)?  $default,){
final _that = this;
switch (_that) {
case _InsightValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsightValue() when $default != null:
return $default(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int value)  $default,) {final _that = this;
switch (_that) {
case _InsightValue():
return $default(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int value)?  $default,) {final _that = this;
switch (_that) {
case _InsightValue() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsightValue implements InsightValue {
  const _InsightValue({required this.value});
  factory _InsightValue.fromJson(Map<String, dynamic> json) => _$InsightValueFromJson(json);

@override final  int value;

/// Create a copy of InsightValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsightValueCopyWith<_InsightValue> get copyWith => __$InsightValueCopyWithImpl<_InsightValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsightValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsightValue&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InsightValue(value: $value)';
}


}

/// @nodoc
abstract mixin class _$InsightValueCopyWith<$Res> implements $InsightValueCopyWith<$Res> {
  factory _$InsightValueCopyWith(_InsightValue value, $Res Function(_InsightValue) _then) = __$InsightValueCopyWithImpl;
@override @useResult
$Res call({
 int value
});




}
/// @nodoc
class __$InsightValueCopyWithImpl<$Res>
    implements _$InsightValueCopyWith<$Res> {
  __$InsightValueCopyWithImpl(this._self, this._then);

  final _InsightValue _self;
  final $Res Function(_InsightValue) _then;

/// Create a copy of InsightValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_InsightValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProfileInsightModel {

 String get id; String get name; String get title; String get period; String get description;@JsonKey(name: 'total_value') InsightValue get totalValue;
/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileInsightModelCopyWith<ProfileInsightModel> get copyWith => _$ProfileInsightModelCopyWithImpl<ProfileInsightModel>(this as ProfileInsightModel, _$identity);

  /// Serializes this ProfileInsightModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInsightModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.period, period) || other.period == period)&&(identical(other.description, description) || other.description == description)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,title,period,description,totalValue);

@override
String toString() {
  return 'ProfileInsightModel(id: $id, name: $name, title: $title, period: $period, description: $description, totalValue: $totalValue)';
}


}

/// @nodoc
abstract mixin class $ProfileInsightModelCopyWith<$Res>  {
  factory $ProfileInsightModelCopyWith(ProfileInsightModel value, $Res Function(ProfileInsightModel) _then) = _$ProfileInsightModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String title, String period, String description,@JsonKey(name: 'total_value') InsightValue totalValue
});


$InsightValueCopyWith<$Res> get totalValue;

}
/// @nodoc
class _$ProfileInsightModelCopyWithImpl<$Res>
    implements $ProfileInsightModelCopyWith<$Res> {
  _$ProfileInsightModelCopyWithImpl(this._self, this._then);

  final ProfileInsightModel _self;
  final $Res Function(ProfileInsightModel) _then;

/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = null,Object? period = null,Object? description = null,Object? totalValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as InsightValue,
  ));
}
/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsightValueCopyWith<$Res> get totalValue {
  
  return $InsightValueCopyWith<$Res>(_self.totalValue, (value) {
    return _then(_self.copyWith(totalValue: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileInsightModel].
extension ProfileInsightModelPatterns on ProfileInsightModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileInsightModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileInsightModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileInsightModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileInsightModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileInsightModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileInsightModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String title,  String period,  String description, @JsonKey(name: 'total_value')  InsightValue totalValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileInsightModel() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.totalValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String title,  String period,  String description, @JsonKey(name: 'total_value')  InsightValue totalValue)  $default,) {final _that = this;
switch (_that) {
case _ProfileInsightModel():
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.totalValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String title,  String period,  String description, @JsonKey(name: 'total_value')  InsightValue totalValue)?  $default,) {final _that = this;
switch (_that) {
case _ProfileInsightModel() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.totalValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileInsightModel implements ProfileInsightModel {
  const _ProfileInsightModel({required this.id, required this.name, required this.title, required this.period, required this.description, @JsonKey(name: 'total_value') required this.totalValue});
  factory _ProfileInsightModel.fromJson(Map<String, dynamic> json) => _$ProfileInsightModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String title;
@override final  String period;
@override final  String description;
@override@JsonKey(name: 'total_value') final  InsightValue totalValue;

/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileInsightModelCopyWith<_ProfileInsightModel> get copyWith => __$ProfileInsightModelCopyWithImpl<_ProfileInsightModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileInsightModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileInsightModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.period, period) || other.period == period)&&(identical(other.description, description) || other.description == description)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,title,period,description,totalValue);

@override
String toString() {
  return 'ProfileInsightModel(id: $id, name: $name, title: $title, period: $period, description: $description, totalValue: $totalValue)';
}


}

/// @nodoc
abstract mixin class _$ProfileInsightModelCopyWith<$Res> implements $ProfileInsightModelCopyWith<$Res> {
  factory _$ProfileInsightModelCopyWith(_ProfileInsightModel value, $Res Function(_ProfileInsightModel) _then) = __$ProfileInsightModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String title, String period, String description,@JsonKey(name: 'total_value') InsightValue totalValue
});


@override $InsightValueCopyWith<$Res> get totalValue;

}
/// @nodoc
class __$ProfileInsightModelCopyWithImpl<$Res>
    implements _$ProfileInsightModelCopyWith<$Res> {
  __$ProfileInsightModelCopyWithImpl(this._self, this._then);

  final _ProfileInsightModel _self;
  final $Res Function(_ProfileInsightModel) _then;

/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = null,Object? period = null,Object? description = null,Object? totalValue = null,}) {
  return _then(_ProfileInsightModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as InsightValue,
  ));
}

/// Create a copy of ProfileInsightModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsightValueCopyWith<$Res> get totalValue {
  
  return $InsightValueCopyWith<$Res>(_self.totalValue, (value) {
    return _then(_self.copyWith(totalValue: value));
  });
}
}


/// @nodoc
mixin _$InstagramMediaModel {

 int get id; int get owner;@JsonKey(name: 'media_id') String get mediaId;@JsonKey(name: 'media_type') String get mediaType;@JsonKey(name: 'media_url') String get mediaUrl;@JsonKey(name: 'thumbnail_url') String get thumbnailUrl; String get link; String get caption;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'comments_count') int get commentsCount;@JsonKey(name: 'insights_raw') List<MediaInsightModel> get insights;
/// Create a copy of InstagramMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstagramMediaModelCopyWith<InstagramMediaModel> get copyWith => _$InstagramMediaModelCopyWithImpl<InstagramMediaModel>(this as InstagramMediaModel, _$identity);

  /// Serializes this InstagramMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstagramMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other.insights, insights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,owner,mediaId,mediaType,mediaUrl,thumbnailUrl,link,caption,likeCount,commentsCount,const DeepCollectionEquality().hash(insights));

@override
String toString() {
  return 'InstagramMediaModel(id: $id, owner: $owner, mediaId: $mediaId, mediaType: $mediaType, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, link: $link, caption: $caption, likeCount: $likeCount, commentsCount: $commentsCount, insights: $insights)';
}


}

/// @nodoc
abstract mixin class $InstagramMediaModelCopyWith<$Res>  {
  factory $InstagramMediaModelCopyWith(InstagramMediaModel value, $Res Function(InstagramMediaModel) _then) = _$InstagramMediaModelCopyWithImpl;
@useResult
$Res call({
 int id, int owner,@JsonKey(name: 'media_id') String mediaId,@JsonKey(name: 'media_type') String mediaType,@JsonKey(name: 'media_url') String mediaUrl,@JsonKey(name: 'thumbnail_url') String thumbnailUrl, String link, String caption,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comments_count') int commentsCount,@JsonKey(name: 'insights_raw') List<MediaInsightModel> insights
});




}
/// @nodoc
class _$InstagramMediaModelCopyWithImpl<$Res>
    implements $InstagramMediaModelCopyWith<$Res> {
  _$InstagramMediaModelCopyWithImpl(this._self, this._then);

  final InstagramMediaModel _self;
  final $Res Function(InstagramMediaModel) _then;

/// Create a copy of InstagramMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? owner = null,Object? mediaId = null,Object? mediaType = null,Object? mediaUrl = null,Object? thumbnailUrl = null,Object? link = null,Object? caption = null,Object? likeCount = null,Object? commentsCount = null,Object? insights = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as int,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,insights: null == insights ? _self.insights : insights // ignore: cast_nullable_to_non_nullable
as List<MediaInsightModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [InstagramMediaModel].
extension InstagramMediaModelPatterns on InstagramMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstagramMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstagramMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstagramMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _InstagramMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstagramMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _InstagramMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int owner, @JsonKey(name: 'media_id')  String mediaId, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String mediaUrl, @JsonKey(name: 'thumbnail_url')  String thumbnailUrl,  String link,  String caption, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'insights_raw')  List<MediaInsightModel> insights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstagramMediaModel() when $default != null:
return $default(_that.id,_that.owner,_that.mediaId,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.link,_that.caption,_that.likeCount,_that.commentsCount,_that.insights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int owner, @JsonKey(name: 'media_id')  String mediaId, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String mediaUrl, @JsonKey(name: 'thumbnail_url')  String thumbnailUrl,  String link,  String caption, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'insights_raw')  List<MediaInsightModel> insights)  $default,) {final _that = this;
switch (_that) {
case _InstagramMediaModel():
return $default(_that.id,_that.owner,_that.mediaId,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.link,_that.caption,_that.likeCount,_that.commentsCount,_that.insights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int owner, @JsonKey(name: 'media_id')  String mediaId, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String mediaUrl, @JsonKey(name: 'thumbnail_url')  String thumbnailUrl,  String link,  String caption, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'insights_raw')  List<MediaInsightModel> insights)?  $default,) {final _that = this;
switch (_that) {
case _InstagramMediaModel() when $default != null:
return $default(_that.id,_that.owner,_that.mediaId,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.link,_that.caption,_that.likeCount,_that.commentsCount,_that.insights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstagramMediaModel implements InstagramMediaModel {
  const _InstagramMediaModel({required this.id, required this.owner, @JsonKey(name: 'media_id') required this.mediaId, @JsonKey(name: 'media_type') required this.mediaType, @JsonKey(name: 'media_url') required this.mediaUrl, @JsonKey(name: 'thumbnail_url') required this.thumbnailUrl, required this.link, required this.caption, @JsonKey(name: 'like_count') required this.likeCount, @JsonKey(name: 'comments_count') required this.commentsCount, @JsonKey(name: 'insights_raw') required final  List<MediaInsightModel> insights}): _insights = insights;
  factory _InstagramMediaModel.fromJson(Map<String, dynamic> json) => _$InstagramMediaModelFromJson(json);

@override final  int id;
@override final  int owner;
@override@JsonKey(name: 'media_id') final  String mediaId;
@override@JsonKey(name: 'media_type') final  String mediaType;
@override@JsonKey(name: 'media_url') final  String mediaUrl;
@override@JsonKey(name: 'thumbnail_url') final  String thumbnailUrl;
@override final  String link;
@override final  String caption;
@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'comments_count') final  int commentsCount;
 final  List<MediaInsightModel> _insights;
@override@JsonKey(name: 'insights_raw') List<MediaInsightModel> get insights {
  if (_insights is EqualUnmodifiableListView) return _insights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insights);
}


/// Create a copy of InstagramMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstagramMediaModelCopyWith<_InstagramMediaModel> get copyWith => __$InstagramMediaModelCopyWithImpl<_InstagramMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstagramMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstagramMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other._insights, _insights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,owner,mediaId,mediaType,mediaUrl,thumbnailUrl,link,caption,likeCount,commentsCount,const DeepCollectionEquality().hash(_insights));

@override
String toString() {
  return 'InstagramMediaModel(id: $id, owner: $owner, mediaId: $mediaId, mediaType: $mediaType, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, link: $link, caption: $caption, likeCount: $likeCount, commentsCount: $commentsCount, insights: $insights)';
}


}

/// @nodoc
abstract mixin class _$InstagramMediaModelCopyWith<$Res> implements $InstagramMediaModelCopyWith<$Res> {
  factory _$InstagramMediaModelCopyWith(_InstagramMediaModel value, $Res Function(_InstagramMediaModel) _then) = __$InstagramMediaModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int owner,@JsonKey(name: 'media_id') String mediaId,@JsonKey(name: 'media_type') String mediaType,@JsonKey(name: 'media_url') String mediaUrl,@JsonKey(name: 'thumbnail_url') String thumbnailUrl, String link, String caption,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comments_count') int commentsCount,@JsonKey(name: 'insights_raw') List<MediaInsightModel> insights
});




}
/// @nodoc
class __$InstagramMediaModelCopyWithImpl<$Res>
    implements _$InstagramMediaModelCopyWith<$Res> {
  __$InstagramMediaModelCopyWithImpl(this._self, this._then);

  final _InstagramMediaModel _self;
  final $Res Function(_InstagramMediaModel) _then;

/// Create a copy of InstagramMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? owner = null,Object? mediaId = null,Object? mediaType = null,Object? mediaUrl = null,Object? thumbnailUrl = null,Object? link = null,Object? caption = null,Object? likeCount = null,Object? commentsCount = null,Object? insights = null,}) {
  return _then(_InstagramMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as int,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,insights: null == insights ? _self._insights : insights // ignore: cast_nullable_to_non_nullable
as List<MediaInsightModel>,
  ));
}


}


/// @nodoc
mixin _$MediaInsightModel {

 String get id; String get name; String get title; String get period; String get description; List<InsightValue> get values;
/// Create a copy of MediaInsightModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaInsightModelCopyWith<MediaInsightModel> get copyWith => _$MediaInsightModelCopyWithImpl<MediaInsightModel>(this as MediaInsightModel, _$identity);

  /// Serializes this MediaInsightModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaInsightModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.period, period) || other.period == period)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,title,period,description,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'MediaInsightModel(id: $id, name: $name, title: $title, period: $period, description: $description, values: $values)';
}


}

/// @nodoc
abstract mixin class $MediaInsightModelCopyWith<$Res>  {
  factory $MediaInsightModelCopyWith(MediaInsightModel value, $Res Function(MediaInsightModel) _then) = _$MediaInsightModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String title, String period, String description, List<InsightValue> values
});




}
/// @nodoc
class _$MediaInsightModelCopyWithImpl<$Res>
    implements $MediaInsightModelCopyWith<$Res> {
  _$MediaInsightModelCopyWithImpl(this._self, this._then);

  final MediaInsightModel _self;
  final $Res Function(MediaInsightModel) _then;

/// Create a copy of MediaInsightModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = null,Object? period = null,Object? description = null,Object? values = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<InsightValue>,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaInsightModel].
extension MediaInsightModelPatterns on MediaInsightModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaInsightModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaInsightModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaInsightModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaInsightModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaInsightModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaInsightModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String title,  String period,  String description,  List<InsightValue> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaInsightModel() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String title,  String period,  String description,  List<InsightValue> values)  $default,) {final _that = this;
switch (_that) {
case _MediaInsightModel():
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String title,  String period,  String description,  List<InsightValue> values)?  $default,) {final _that = this;
switch (_that) {
case _MediaInsightModel() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.period,_that.description,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaInsightModel implements MediaInsightModel {
  const _MediaInsightModel({required this.id, required this.name, required this.title, required this.period, required this.description, required final  List<InsightValue> values}): _values = values;
  factory _MediaInsightModel.fromJson(Map<String, dynamic> json) => _$MediaInsightModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String title;
@override final  String period;
@override final  String description;
 final  List<InsightValue> _values;
@override List<InsightValue> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of MediaInsightModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaInsightModelCopyWith<_MediaInsightModel> get copyWith => __$MediaInsightModelCopyWithImpl<_MediaInsightModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaInsightModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaInsightModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.period, period) || other.period == period)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,title,period,description,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'MediaInsightModel(id: $id, name: $name, title: $title, period: $period, description: $description, values: $values)';
}


}

/// @nodoc
abstract mixin class _$MediaInsightModelCopyWith<$Res> implements $MediaInsightModelCopyWith<$Res> {
  factory _$MediaInsightModelCopyWith(_MediaInsightModel value, $Res Function(_MediaInsightModel) _then) = __$MediaInsightModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String title, String period, String description, List<InsightValue> values
});




}
/// @nodoc
class __$MediaInsightModelCopyWithImpl<$Res>
    implements _$MediaInsightModelCopyWith<$Res> {
  __$MediaInsightModelCopyWithImpl(this._self, this._then);

  final _MediaInsightModel _self;
  final $Res Function(_MediaInsightModel) _then;

/// Create a copy of MediaInsightModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = null,Object? period = null,Object? description = null,Object? values = null,}) {
  return _then(_MediaInsightModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<InsightValue>,
  ));
}


}


/// @nodoc
mixin _$YoutubeChannelModel {

 int get id; String get title;@JsonKey(name: 'channel_id') String get channelId; String get description;@JsonKey(name: 'profile_picture_url') String get profilePicture;@JsonKey(name: 'banner_url') String get banner;@JsonKey(name: 'subscriber_count') int get subscriberCount;@JsonKey(name: 'view_count') int get viewCount;@JsonKey(name: 'video_count') int get videoCount;
/// Create a copy of YoutubeChannelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeChannelModelCopyWith<YoutubeChannelModel> get copyWith => _$YoutubeChannelModelCopyWithImpl<YoutubeChannelModel>(this as YoutubeChannelModel, _$identity);

  /// Serializes this YoutubeChannelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.description, description) || other.description == description)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.subscriberCount, subscriberCount) || other.subscriberCount == subscriberCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.videoCount, videoCount) || other.videoCount == videoCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,channelId,description,profilePicture,banner,subscriberCount,viewCount,videoCount);

@override
String toString() {
  return 'YoutubeChannelModel(id: $id, title: $title, channelId: $channelId, description: $description, profilePicture: $profilePicture, banner: $banner, subscriberCount: $subscriberCount, viewCount: $viewCount, videoCount: $videoCount)';
}


}

/// @nodoc
abstract mixin class $YoutubeChannelModelCopyWith<$Res>  {
  factory $YoutubeChannelModelCopyWith(YoutubeChannelModel value, $Res Function(YoutubeChannelModel) _then) = _$YoutubeChannelModelCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'channel_id') String channelId, String description,@JsonKey(name: 'profile_picture_url') String profilePicture,@JsonKey(name: 'banner_url') String banner,@JsonKey(name: 'subscriber_count') int subscriberCount,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'video_count') int videoCount
});




}
/// @nodoc
class _$YoutubeChannelModelCopyWithImpl<$Res>
    implements $YoutubeChannelModelCopyWith<$Res> {
  _$YoutubeChannelModelCopyWithImpl(this._self, this._then);

  final YoutubeChannelModel _self;
  final $Res Function(YoutubeChannelModel) _then;

/// Create a copy of YoutubeChannelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? channelId = null,Object? description = null,Object? profilePicture = null,Object? banner = null,Object? subscriberCount = null,Object? viewCount = null,Object? videoCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as String,subscriberCount: null == subscriberCount ? _self.subscriberCount : subscriberCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,videoCount: null == videoCount ? _self.videoCount : videoCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [YoutubeChannelModel].
extension YoutubeChannelModelPatterns on YoutubeChannelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YoutubeChannelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YoutubeChannelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YoutubeChannelModel value)  $default,){
final _that = this;
switch (_that) {
case _YoutubeChannelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YoutubeChannelModel value)?  $default,){
final _that = this;
switch (_that) {
case _YoutubeChannelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'channel_id')  String channelId,  String description, @JsonKey(name: 'profile_picture_url')  String profilePicture, @JsonKey(name: 'banner_url')  String banner, @JsonKey(name: 'subscriber_count')  int subscriberCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'video_count')  int videoCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YoutubeChannelModel() when $default != null:
return $default(_that.id,_that.title,_that.channelId,_that.description,_that.profilePicture,_that.banner,_that.subscriberCount,_that.viewCount,_that.videoCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'channel_id')  String channelId,  String description, @JsonKey(name: 'profile_picture_url')  String profilePicture, @JsonKey(name: 'banner_url')  String banner, @JsonKey(name: 'subscriber_count')  int subscriberCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'video_count')  int videoCount)  $default,) {final _that = this;
switch (_that) {
case _YoutubeChannelModel():
return $default(_that.id,_that.title,_that.channelId,_that.description,_that.profilePicture,_that.banner,_that.subscriberCount,_that.viewCount,_that.videoCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'channel_id')  String channelId,  String description, @JsonKey(name: 'profile_picture_url')  String profilePicture, @JsonKey(name: 'banner_url')  String banner, @JsonKey(name: 'subscriber_count')  int subscriberCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'video_count')  int videoCount)?  $default,) {final _that = this;
switch (_that) {
case _YoutubeChannelModel() when $default != null:
return $default(_that.id,_that.title,_that.channelId,_that.description,_that.profilePicture,_that.banner,_that.subscriberCount,_that.viewCount,_that.videoCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YoutubeChannelModel implements YoutubeChannelModel {
  const _YoutubeChannelModel({required this.id, required this.title, @JsonKey(name: 'channel_id') required this.channelId, required this.description, @JsonKey(name: 'profile_picture_url') required this.profilePicture, @JsonKey(name: 'banner_url') required this.banner, @JsonKey(name: 'subscriber_count') required this.subscriberCount, @JsonKey(name: 'view_count') required this.viewCount, @JsonKey(name: 'video_count') required this.videoCount});
  factory _YoutubeChannelModel.fromJson(Map<String, dynamic> json) => _$YoutubeChannelModelFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'channel_id') final  String channelId;
@override final  String description;
@override@JsonKey(name: 'profile_picture_url') final  String profilePicture;
@override@JsonKey(name: 'banner_url') final  String banner;
@override@JsonKey(name: 'subscriber_count') final  int subscriberCount;
@override@JsonKey(name: 'view_count') final  int viewCount;
@override@JsonKey(name: 'video_count') final  int videoCount;

/// Create a copy of YoutubeChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeChannelModelCopyWith<_YoutubeChannelModel> get copyWith => __$YoutubeChannelModelCopyWithImpl<_YoutubeChannelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YoutubeChannelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.description, description) || other.description == description)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.subscriberCount, subscriberCount) || other.subscriberCount == subscriberCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.videoCount, videoCount) || other.videoCount == videoCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,channelId,description,profilePicture,banner,subscriberCount,viewCount,videoCount);

@override
String toString() {
  return 'YoutubeChannelModel(id: $id, title: $title, channelId: $channelId, description: $description, profilePicture: $profilePicture, banner: $banner, subscriberCount: $subscriberCount, viewCount: $viewCount, videoCount: $videoCount)';
}


}

/// @nodoc
abstract mixin class _$YoutubeChannelModelCopyWith<$Res> implements $YoutubeChannelModelCopyWith<$Res> {
  factory _$YoutubeChannelModelCopyWith(_YoutubeChannelModel value, $Res Function(_YoutubeChannelModel) _then) = __$YoutubeChannelModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'channel_id') String channelId, String description,@JsonKey(name: 'profile_picture_url') String profilePicture,@JsonKey(name: 'banner_url') String banner,@JsonKey(name: 'subscriber_count') int subscriberCount,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'video_count') int videoCount
});




}
/// @nodoc
class __$YoutubeChannelModelCopyWithImpl<$Res>
    implements _$YoutubeChannelModelCopyWith<$Res> {
  __$YoutubeChannelModelCopyWithImpl(this._self, this._then);

  final _YoutubeChannelModel _self;
  final $Res Function(_YoutubeChannelModel) _then;

/// Create a copy of YoutubeChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? channelId = null,Object? description = null,Object? profilePicture = null,Object? banner = null,Object? subscriberCount = null,Object? viewCount = null,Object? videoCount = null,}) {
  return _then(_YoutubeChannelModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as String,subscriberCount: null == subscriberCount ? _self.subscriberCount : subscriberCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,videoCount: null == videoCount ? _self.videoCount : videoCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$YoutubeMediaModel {

 int get id;@JsonKey(name: 'media_id') String get mediaId; String get title; String get description;@JsonKey(name: 'thumbnail_url') String get thumbnail; int get views; int get likes; int get comments;
/// Create a copy of YoutubeMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeMediaModelCopyWith<YoutubeMediaModel> get copyWith => _$YoutubeMediaModelCopyWithImpl<YoutubeMediaModel>(this as YoutubeMediaModel, _$identity);

  /// Serializes this YoutubeMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.views, views) || other.views == views)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.comments, comments) || other.comments == comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaId,title,description,thumbnail,views,likes,comments);

@override
String toString() {
  return 'YoutubeMediaModel(id: $id, mediaId: $mediaId, title: $title, description: $description, thumbnail: $thumbnail, views: $views, likes: $likes, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $YoutubeMediaModelCopyWith<$Res>  {
  factory $YoutubeMediaModelCopyWith(YoutubeMediaModel value, $Res Function(YoutubeMediaModel) _then) = _$YoutubeMediaModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'media_id') String mediaId, String title, String description,@JsonKey(name: 'thumbnail_url') String thumbnail, int views, int likes, int comments
});




}
/// @nodoc
class _$YoutubeMediaModelCopyWithImpl<$Res>
    implements $YoutubeMediaModelCopyWith<$Res> {
  _$YoutubeMediaModelCopyWithImpl(this._self, this._then);

  final YoutubeMediaModel _self;
  final $Res Function(YoutubeMediaModel) _then;

/// Create a copy of YoutubeMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaId = null,Object? title = null,Object? description = null,Object? thumbnail = null,Object? views = null,Object? likes = null,Object? comments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [YoutubeMediaModel].
extension YoutubeMediaModelPatterns on YoutubeMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YoutubeMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YoutubeMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YoutubeMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _YoutubeMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YoutubeMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _YoutubeMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'media_id')  String mediaId,  String title,  String description, @JsonKey(name: 'thumbnail_url')  String thumbnail,  int views,  int likes,  int comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YoutubeMediaModel() when $default != null:
return $default(_that.id,_that.mediaId,_that.title,_that.description,_that.thumbnail,_that.views,_that.likes,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'media_id')  String mediaId,  String title,  String description, @JsonKey(name: 'thumbnail_url')  String thumbnail,  int views,  int likes,  int comments)  $default,) {final _that = this;
switch (_that) {
case _YoutubeMediaModel():
return $default(_that.id,_that.mediaId,_that.title,_that.description,_that.thumbnail,_that.views,_that.likes,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'media_id')  String mediaId,  String title,  String description, @JsonKey(name: 'thumbnail_url')  String thumbnail,  int views,  int likes,  int comments)?  $default,) {final _that = this;
switch (_that) {
case _YoutubeMediaModel() when $default != null:
return $default(_that.id,_that.mediaId,_that.title,_that.description,_that.thumbnail,_that.views,_that.likes,_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YoutubeMediaModel implements YoutubeMediaModel {
  const _YoutubeMediaModel({required this.id, @JsonKey(name: 'media_id') required this.mediaId, required this.title, required this.description, @JsonKey(name: 'thumbnail_url') required this.thumbnail, required this.views, required this.likes, required this.comments});
  factory _YoutubeMediaModel.fromJson(Map<String, dynamic> json) => _$YoutubeMediaModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'media_id') final  String mediaId;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'thumbnail_url') final  String thumbnail;
@override final  int views;
@override final  int likes;
@override final  int comments;

/// Create a copy of YoutubeMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeMediaModelCopyWith<_YoutubeMediaModel> get copyWith => __$YoutubeMediaModelCopyWithImpl<_YoutubeMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YoutubeMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.views, views) || other.views == views)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.comments, comments) || other.comments == comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaId,title,description,thumbnail,views,likes,comments);

@override
String toString() {
  return 'YoutubeMediaModel(id: $id, mediaId: $mediaId, title: $title, description: $description, thumbnail: $thumbnail, views: $views, likes: $likes, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$YoutubeMediaModelCopyWith<$Res> implements $YoutubeMediaModelCopyWith<$Res> {
  factory _$YoutubeMediaModelCopyWith(_YoutubeMediaModel value, $Res Function(_YoutubeMediaModel) _then) = __$YoutubeMediaModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'media_id') String mediaId, String title, String description,@JsonKey(name: 'thumbnail_url') String thumbnail, int views, int likes, int comments
});




}
/// @nodoc
class __$YoutubeMediaModelCopyWithImpl<$Res>
    implements _$YoutubeMediaModelCopyWith<$Res> {
  __$YoutubeMediaModelCopyWithImpl(this._self, this._then);

  final _YoutubeMediaModel _self;
  final $Res Function(_YoutubeMediaModel) _then;

/// Create a copy of YoutubeMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaId = null,Object? title = null,Object? description = null,Object? thumbnail = null,Object? views = null,Object? likes = null,Object? comments = null,}) {
  return _then(_YoutubeMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$InstagramResponseModel {

@JsonKey(name: 'fb_page') String get fbPage;@JsonKey(name: 'ig_page') String get igPage;
/// Create a copy of InstagramResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstagramResponseModelCopyWith<InstagramResponseModel> get copyWith => _$InstagramResponseModelCopyWithImpl<InstagramResponseModel>(this as InstagramResponseModel, _$identity);

  /// Serializes this InstagramResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstagramResponseModel&&(identical(other.fbPage, fbPage) || other.fbPage == fbPage)&&(identical(other.igPage, igPage) || other.igPage == igPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fbPage,igPage);

@override
String toString() {
  return 'InstagramResponseModel(fbPage: $fbPage, igPage: $igPage)';
}


}

/// @nodoc
abstract mixin class $InstagramResponseModelCopyWith<$Res>  {
  factory $InstagramResponseModelCopyWith(InstagramResponseModel value, $Res Function(InstagramResponseModel) _then) = _$InstagramResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'fb_page') String fbPage,@JsonKey(name: 'ig_page') String igPage
});




}
/// @nodoc
class _$InstagramResponseModelCopyWithImpl<$Res>
    implements $InstagramResponseModelCopyWith<$Res> {
  _$InstagramResponseModelCopyWithImpl(this._self, this._then);

  final InstagramResponseModel _self;
  final $Res Function(InstagramResponseModel) _then;

/// Create a copy of InstagramResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fbPage = null,Object? igPage = null,}) {
  return _then(_self.copyWith(
fbPage: null == fbPage ? _self.fbPage : fbPage // ignore: cast_nullable_to_non_nullable
as String,igPage: null == igPage ? _self.igPage : igPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InstagramResponseModel].
extension InstagramResponseModelPatterns on InstagramResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstagramResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstagramResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstagramResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _InstagramResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstagramResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _InstagramResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'fb_page')  String fbPage, @JsonKey(name: 'ig_page')  String igPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstagramResponseModel() when $default != null:
return $default(_that.fbPage,_that.igPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'fb_page')  String fbPage, @JsonKey(name: 'ig_page')  String igPage)  $default,) {final _that = this;
switch (_that) {
case _InstagramResponseModel():
return $default(_that.fbPage,_that.igPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'fb_page')  String fbPage, @JsonKey(name: 'ig_page')  String igPage)?  $default,) {final _that = this;
switch (_that) {
case _InstagramResponseModel() when $default != null:
return $default(_that.fbPage,_that.igPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstagramResponseModel implements InstagramResponseModel {
  const _InstagramResponseModel({@JsonKey(name: 'fb_page') required this.fbPage, @JsonKey(name: 'ig_page') required this.igPage});
  factory _InstagramResponseModel.fromJson(Map<String, dynamic> json) => _$InstagramResponseModelFromJson(json);

@override@JsonKey(name: 'fb_page') final  String fbPage;
@override@JsonKey(name: 'ig_page') final  String igPage;

/// Create a copy of InstagramResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstagramResponseModelCopyWith<_InstagramResponseModel> get copyWith => __$InstagramResponseModelCopyWithImpl<_InstagramResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstagramResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstagramResponseModel&&(identical(other.fbPage, fbPage) || other.fbPage == fbPage)&&(identical(other.igPage, igPage) || other.igPage == igPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fbPage,igPage);

@override
String toString() {
  return 'InstagramResponseModel(fbPage: $fbPage, igPage: $igPage)';
}


}

/// @nodoc
abstract mixin class _$InstagramResponseModelCopyWith<$Res> implements $InstagramResponseModelCopyWith<$Res> {
  factory _$InstagramResponseModelCopyWith(_InstagramResponseModel value, $Res Function(_InstagramResponseModel) _then) = __$InstagramResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'fb_page') String fbPage,@JsonKey(name: 'ig_page') String igPage
});




}
/// @nodoc
class __$InstagramResponseModelCopyWithImpl<$Res>
    implements _$InstagramResponseModelCopyWith<$Res> {
  __$InstagramResponseModelCopyWithImpl(this._self, this._then);

  final _InstagramResponseModel _self;
  final $Res Function(_InstagramResponseModel) _then;

/// Create a copy of InstagramResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fbPage = null,Object? igPage = null,}) {
  return _then(_InstagramResponseModel(
fbPage: null == fbPage ? _self.fbPage : fbPage // ignore: cast_nullable_to_non_nullable
as String,igPage: null == igPage ? _self.igPage : igPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InstagramPageResponse {

@JsonKey(name: 'profile_data') InstagramPageModel get profileData;
/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstagramPageResponseCopyWith<InstagramPageResponse> get copyWith => _$InstagramPageResponseCopyWithImpl<InstagramPageResponse>(this as InstagramPageResponse, _$identity);

  /// Serializes this InstagramPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstagramPageResponse&&(identical(other.profileData, profileData) || other.profileData == profileData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileData);

@override
String toString() {
  return 'InstagramPageResponse(profileData: $profileData)';
}


}

/// @nodoc
abstract mixin class $InstagramPageResponseCopyWith<$Res>  {
  factory $InstagramPageResponseCopyWith(InstagramPageResponse value, $Res Function(InstagramPageResponse) _then) = _$InstagramPageResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'profile_data') InstagramPageModel profileData
});


$InstagramPageModelCopyWith<$Res> get profileData;

}
/// @nodoc
class _$InstagramPageResponseCopyWithImpl<$Res>
    implements $InstagramPageResponseCopyWith<$Res> {
  _$InstagramPageResponseCopyWithImpl(this._self, this._then);

  final InstagramPageResponse _self;
  final $Res Function(InstagramPageResponse) _then;

/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileData = null,}) {
  return _then(_self.copyWith(
profileData: null == profileData ? _self.profileData : profileData // ignore: cast_nullable_to_non_nullable
as InstagramPageModel,
  ));
}
/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstagramPageModelCopyWith<$Res> get profileData {
  
  return $InstagramPageModelCopyWith<$Res>(_self.profileData, (value) {
    return _then(_self.copyWith(profileData: value));
  });
}
}


/// Adds pattern-matching-related methods to [InstagramPageResponse].
extension InstagramPageResponsePatterns on InstagramPageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstagramPageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstagramPageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstagramPageResponse value)  $default,){
final _that = this;
switch (_that) {
case _InstagramPageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstagramPageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InstagramPageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'profile_data')  InstagramPageModel profileData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstagramPageResponse() when $default != null:
return $default(_that.profileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'profile_data')  InstagramPageModel profileData)  $default,) {final _that = this;
switch (_that) {
case _InstagramPageResponse():
return $default(_that.profileData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'profile_data')  InstagramPageModel profileData)?  $default,) {final _that = this;
switch (_that) {
case _InstagramPageResponse() when $default != null:
return $default(_that.profileData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstagramPageResponse implements InstagramPageResponse {
  const _InstagramPageResponse({@JsonKey(name: 'profile_data') required this.profileData});
  factory _InstagramPageResponse.fromJson(Map<String, dynamic> json) => _$InstagramPageResponseFromJson(json);

@override@JsonKey(name: 'profile_data') final  InstagramPageModel profileData;

/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstagramPageResponseCopyWith<_InstagramPageResponse> get copyWith => __$InstagramPageResponseCopyWithImpl<_InstagramPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstagramPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstagramPageResponse&&(identical(other.profileData, profileData) || other.profileData == profileData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileData);

@override
String toString() {
  return 'InstagramPageResponse(profileData: $profileData)';
}


}

/// @nodoc
abstract mixin class _$InstagramPageResponseCopyWith<$Res> implements $InstagramPageResponseCopyWith<$Res> {
  factory _$InstagramPageResponseCopyWith(_InstagramPageResponse value, $Res Function(_InstagramPageResponse) _then) = __$InstagramPageResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'profile_data') InstagramPageModel profileData
});


@override $InstagramPageModelCopyWith<$Res> get profileData;

}
/// @nodoc
class __$InstagramPageResponseCopyWithImpl<$Res>
    implements _$InstagramPageResponseCopyWith<$Res> {
  __$InstagramPageResponseCopyWithImpl(this._self, this._then);

  final _InstagramPageResponse _self;
  final $Res Function(_InstagramPageResponse) _then;

/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileData = null,}) {
  return _then(_InstagramPageResponse(
profileData: null == profileData ? _self.profileData : profileData // ignore: cast_nullable_to_non_nullable
as InstagramPageModel,
  ));
}

/// Create a copy of InstagramPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstagramPageModelCopyWith<$Res> get profileData {
  
  return $InstagramPageModelCopyWith<$Res>(_self.profileData, (value) {
    return _then(_self.copyWith(profileData: value));
  });
}
}


/// @nodoc
mixin _$InstagramMediaResponse {

 List<InstagramMediaModel> get media;
/// Create a copy of InstagramMediaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstagramMediaResponseCopyWith<InstagramMediaResponse> get copyWith => _$InstagramMediaResponseCopyWithImpl<InstagramMediaResponse>(this as InstagramMediaResponse, _$identity);

  /// Serializes this InstagramMediaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstagramMediaResponse&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'InstagramMediaResponse(media: $media)';
}


}

/// @nodoc
abstract mixin class $InstagramMediaResponseCopyWith<$Res>  {
  factory $InstagramMediaResponseCopyWith(InstagramMediaResponse value, $Res Function(InstagramMediaResponse) _then) = _$InstagramMediaResponseCopyWithImpl;
@useResult
$Res call({
 List<InstagramMediaModel> media
});




}
/// @nodoc
class _$InstagramMediaResponseCopyWithImpl<$Res>
    implements $InstagramMediaResponseCopyWith<$Res> {
  _$InstagramMediaResponseCopyWithImpl(this._self, this._then);

  final InstagramMediaResponse _self;
  final $Res Function(InstagramMediaResponse) _then;

/// Create a copy of InstagramMediaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? media = null,}) {
  return _then(_self.copyWith(
media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<InstagramMediaModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [InstagramMediaResponse].
extension InstagramMediaResponsePatterns on InstagramMediaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstagramMediaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstagramMediaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstagramMediaResponse value)  $default,){
final _that = this;
switch (_that) {
case _InstagramMediaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstagramMediaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InstagramMediaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InstagramMediaModel> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstagramMediaResponse() when $default != null:
return $default(_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InstagramMediaModel> media)  $default,) {final _that = this;
switch (_that) {
case _InstagramMediaResponse():
return $default(_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InstagramMediaModel> media)?  $default,) {final _that = this;
switch (_that) {
case _InstagramMediaResponse() when $default != null:
return $default(_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InstagramMediaResponse implements InstagramMediaResponse {
  const _InstagramMediaResponse({required final  List<InstagramMediaModel> media}): _media = media;
  factory _InstagramMediaResponse.fromJson(Map<String, dynamic> json) => _$InstagramMediaResponseFromJson(json);

 final  List<InstagramMediaModel> _media;
@override List<InstagramMediaModel> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}


/// Create a copy of InstagramMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstagramMediaResponseCopyWith<_InstagramMediaResponse> get copyWith => __$InstagramMediaResponseCopyWithImpl<_InstagramMediaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstagramMediaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstagramMediaResponse&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'InstagramMediaResponse(media: $media)';
}


}

/// @nodoc
abstract mixin class _$InstagramMediaResponseCopyWith<$Res> implements $InstagramMediaResponseCopyWith<$Res> {
  factory _$InstagramMediaResponseCopyWith(_InstagramMediaResponse value, $Res Function(_InstagramMediaResponse) _then) = __$InstagramMediaResponseCopyWithImpl;
@override @useResult
$Res call({
 List<InstagramMediaModel> media
});




}
/// @nodoc
class __$InstagramMediaResponseCopyWithImpl<$Res>
    implements _$InstagramMediaResponseCopyWith<$Res> {
  __$InstagramMediaResponseCopyWithImpl(this._self, this._then);

  final _InstagramMediaResponse _self;
  final $Res Function(_InstagramMediaResponse) _then;

/// Create a copy of InstagramMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? media = null,}) {
  return _then(_InstagramMediaResponse(
media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<InstagramMediaModel>,
  ));
}


}


/// @nodoc
mixin _$YoutubeChannelResponse {

@JsonKey(name: 'channel_data') YoutubeChannelModel get channelData;
/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeChannelResponseCopyWith<YoutubeChannelResponse> get copyWith => _$YoutubeChannelResponseCopyWithImpl<YoutubeChannelResponse>(this as YoutubeChannelResponse, _$identity);

  /// Serializes this YoutubeChannelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeChannelResponse&&(identical(other.channelData, channelData) || other.channelData == channelData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channelData);

@override
String toString() {
  return 'YoutubeChannelResponse(channelData: $channelData)';
}


}

/// @nodoc
abstract mixin class $YoutubeChannelResponseCopyWith<$Res>  {
  factory $YoutubeChannelResponseCopyWith(YoutubeChannelResponse value, $Res Function(YoutubeChannelResponse) _then) = _$YoutubeChannelResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'channel_data') YoutubeChannelModel channelData
});


$YoutubeChannelModelCopyWith<$Res> get channelData;

}
/// @nodoc
class _$YoutubeChannelResponseCopyWithImpl<$Res>
    implements $YoutubeChannelResponseCopyWith<$Res> {
  _$YoutubeChannelResponseCopyWithImpl(this._self, this._then);

  final YoutubeChannelResponse _self;
  final $Res Function(YoutubeChannelResponse) _then;

/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channelData = null,}) {
  return _then(_self.copyWith(
channelData: null == channelData ? _self.channelData : channelData // ignore: cast_nullable_to_non_nullable
as YoutubeChannelModel,
  ));
}
/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YoutubeChannelModelCopyWith<$Res> get channelData {
  
  return $YoutubeChannelModelCopyWith<$Res>(_self.channelData, (value) {
    return _then(_self.copyWith(channelData: value));
  });
}
}


/// Adds pattern-matching-related methods to [YoutubeChannelResponse].
extension YoutubeChannelResponsePatterns on YoutubeChannelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YoutubeChannelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YoutubeChannelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YoutubeChannelResponse value)  $default,){
final _that = this;
switch (_that) {
case _YoutubeChannelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YoutubeChannelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _YoutubeChannelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'channel_data')  YoutubeChannelModel channelData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YoutubeChannelResponse() when $default != null:
return $default(_that.channelData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'channel_data')  YoutubeChannelModel channelData)  $default,) {final _that = this;
switch (_that) {
case _YoutubeChannelResponse():
return $default(_that.channelData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'channel_data')  YoutubeChannelModel channelData)?  $default,) {final _that = this;
switch (_that) {
case _YoutubeChannelResponse() when $default != null:
return $default(_that.channelData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YoutubeChannelResponse implements YoutubeChannelResponse {
  const _YoutubeChannelResponse({@JsonKey(name: 'channel_data') required this.channelData});
  factory _YoutubeChannelResponse.fromJson(Map<String, dynamic> json) => _$YoutubeChannelResponseFromJson(json);

@override@JsonKey(name: 'channel_data') final  YoutubeChannelModel channelData;

/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeChannelResponseCopyWith<_YoutubeChannelResponse> get copyWith => __$YoutubeChannelResponseCopyWithImpl<_YoutubeChannelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YoutubeChannelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeChannelResponse&&(identical(other.channelData, channelData) || other.channelData == channelData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channelData);

@override
String toString() {
  return 'YoutubeChannelResponse(channelData: $channelData)';
}


}

/// @nodoc
abstract mixin class _$YoutubeChannelResponseCopyWith<$Res> implements $YoutubeChannelResponseCopyWith<$Res> {
  factory _$YoutubeChannelResponseCopyWith(_YoutubeChannelResponse value, $Res Function(_YoutubeChannelResponse) _then) = __$YoutubeChannelResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'channel_data') YoutubeChannelModel channelData
});


@override $YoutubeChannelModelCopyWith<$Res> get channelData;

}
/// @nodoc
class __$YoutubeChannelResponseCopyWithImpl<$Res>
    implements _$YoutubeChannelResponseCopyWith<$Res> {
  __$YoutubeChannelResponseCopyWithImpl(this._self, this._then);

  final _YoutubeChannelResponse _self;
  final $Res Function(_YoutubeChannelResponse) _then;

/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channelData = null,}) {
  return _then(_YoutubeChannelResponse(
channelData: null == channelData ? _self.channelData : channelData // ignore: cast_nullable_to_non_nullable
as YoutubeChannelModel,
  ));
}

/// Create a copy of YoutubeChannelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YoutubeChannelModelCopyWith<$Res> get channelData {
  
  return $YoutubeChannelModelCopyWith<$Res>(_self.channelData, (value) {
    return _then(_self.copyWith(channelData: value));
  });
}
}


/// @nodoc
mixin _$YoutubeMediaResponse {

@JsonKey(name: 'media_data') List<YoutubeMediaModel> get data;
/// Create a copy of YoutubeMediaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeMediaResponseCopyWith<YoutubeMediaResponse> get copyWith => _$YoutubeMediaResponseCopyWithImpl<YoutubeMediaResponse>(this as YoutubeMediaResponse, _$identity);

  /// Serializes this YoutubeMediaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeMediaResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'YoutubeMediaResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $YoutubeMediaResponseCopyWith<$Res>  {
  factory $YoutubeMediaResponseCopyWith(YoutubeMediaResponse value, $Res Function(YoutubeMediaResponse) _then) = _$YoutubeMediaResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'media_data') List<YoutubeMediaModel> data
});




}
/// @nodoc
class _$YoutubeMediaResponseCopyWithImpl<$Res>
    implements $YoutubeMediaResponseCopyWith<$Res> {
  _$YoutubeMediaResponseCopyWithImpl(this._self, this._then);

  final YoutubeMediaResponse _self;
  final $Res Function(YoutubeMediaResponse) _then;

/// Create a copy of YoutubeMediaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<YoutubeMediaModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [YoutubeMediaResponse].
extension YoutubeMediaResponsePatterns on YoutubeMediaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YoutubeMediaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YoutubeMediaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YoutubeMediaResponse value)  $default,){
final _that = this;
switch (_that) {
case _YoutubeMediaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YoutubeMediaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _YoutubeMediaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'media_data')  List<YoutubeMediaModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YoutubeMediaResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'media_data')  List<YoutubeMediaModel> data)  $default,) {final _that = this;
switch (_that) {
case _YoutubeMediaResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'media_data')  List<YoutubeMediaModel> data)?  $default,) {final _that = this;
switch (_that) {
case _YoutubeMediaResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YoutubeMediaResponse implements YoutubeMediaResponse {
  const _YoutubeMediaResponse({@JsonKey(name: 'media_data') required final  List<YoutubeMediaModel> data}): _data = data;
  factory _YoutubeMediaResponse.fromJson(Map<String, dynamic> json) => _$YoutubeMediaResponseFromJson(json);

 final  List<YoutubeMediaModel> _data;
@override@JsonKey(name: 'media_data') List<YoutubeMediaModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of YoutubeMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeMediaResponseCopyWith<_YoutubeMediaResponse> get copyWith => __$YoutubeMediaResponseCopyWithImpl<_YoutubeMediaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YoutubeMediaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeMediaResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'YoutubeMediaResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$YoutubeMediaResponseCopyWith<$Res> implements $YoutubeMediaResponseCopyWith<$Res> {
  factory _$YoutubeMediaResponseCopyWith(_YoutubeMediaResponse value, $Res Function(_YoutubeMediaResponse) _then) = __$YoutubeMediaResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'media_data') List<YoutubeMediaModel> data
});




}
/// @nodoc
class __$YoutubeMediaResponseCopyWithImpl<$Res>
    implements _$YoutubeMediaResponseCopyWith<$Res> {
  __$YoutubeMediaResponseCopyWithImpl(this._self, this._then);

  final _YoutubeMediaResponse _self;
  final $Res Function(_YoutubeMediaResponse) _then;

/// Create a copy of YoutubeMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_YoutubeMediaResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<YoutubeMediaModel>,
  ));
}


}

// dart format on
