// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllUsersResponse {

 List<UserContainer> get creators; List<UserContainer> get businesses;
/// Create a copy of AllUsersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllUsersResponseCopyWith<AllUsersResponse> get copyWith => _$AllUsersResponseCopyWithImpl<AllUsersResponse>(this as AllUsersResponse, _$identity);

  /// Serializes this AllUsersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllUsersResponse&&const DeepCollectionEquality().equals(other.creators, creators)&&const DeepCollectionEquality().equals(other.businesses, businesses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(creators),const DeepCollectionEquality().hash(businesses));

@override
String toString() {
  return 'AllUsersResponse(creators: $creators, businesses: $businesses)';
}


}

/// @nodoc
abstract mixin class $AllUsersResponseCopyWith<$Res>  {
  factory $AllUsersResponseCopyWith(AllUsersResponse value, $Res Function(AllUsersResponse) _then) = _$AllUsersResponseCopyWithImpl;
@useResult
$Res call({
 List<UserContainer> creators, List<UserContainer> businesses
});




}
/// @nodoc
class _$AllUsersResponseCopyWithImpl<$Res>
    implements $AllUsersResponseCopyWith<$Res> {
  _$AllUsersResponseCopyWithImpl(this._self, this._then);

  final AllUsersResponse _self;
  final $Res Function(AllUsersResponse) _then;

/// Create a copy of AllUsersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creators = null,Object? businesses = null,}) {
  return _then(_self.copyWith(
creators: null == creators ? _self.creators : creators // ignore: cast_nullable_to_non_nullable
as List<UserContainer>,businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<UserContainer>,
  ));
}

}


/// Adds pattern-matching-related methods to [AllUsersResponse].
extension AllUsersResponsePatterns on AllUsersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllUsersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllUsersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllUsersResponse value)  $default,){
final _that = this;
switch (_that) {
case _AllUsersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllUsersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AllUsersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserContainer> creators,  List<UserContainer> businesses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllUsersResponse() when $default != null:
return $default(_that.creators,_that.businesses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserContainer> creators,  List<UserContainer> businesses)  $default,) {final _that = this;
switch (_that) {
case _AllUsersResponse():
return $default(_that.creators,_that.businesses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserContainer> creators,  List<UserContainer> businesses)?  $default,) {final _that = this;
switch (_that) {
case _AllUsersResponse() when $default != null:
return $default(_that.creators,_that.businesses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllUsersResponse implements AllUsersResponse {
  const _AllUsersResponse({required final  List<UserContainer> creators, required final  List<UserContainer> businesses}): _creators = creators,_businesses = businesses;
  factory _AllUsersResponse.fromJson(Map<String, dynamic> json) => _$AllUsersResponseFromJson(json);

 final  List<UserContainer> _creators;
@override List<UserContainer> get creators {
  if (_creators is EqualUnmodifiableListView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creators);
}

 final  List<UserContainer> _businesses;
@override List<UserContainer> get businesses {
  if (_businesses is EqualUnmodifiableListView) return _businesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businesses);
}


/// Create a copy of AllUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllUsersResponseCopyWith<_AllUsersResponse> get copyWith => __$AllUsersResponseCopyWithImpl<_AllUsersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllUsersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllUsersResponse&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._businesses, _businesses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_businesses));

@override
String toString() {
  return 'AllUsersResponse(creators: $creators, businesses: $businesses)';
}


}

/// @nodoc
abstract mixin class _$AllUsersResponseCopyWith<$Res> implements $AllUsersResponseCopyWith<$Res> {
  factory _$AllUsersResponseCopyWith(_AllUsersResponse value, $Res Function(_AllUsersResponse) _then) = __$AllUsersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<UserContainer> creators, List<UserContainer> businesses
});




}
/// @nodoc
class __$AllUsersResponseCopyWithImpl<$Res>
    implements _$AllUsersResponseCopyWith<$Res> {
  __$AllUsersResponseCopyWithImpl(this._self, this._then);

  final _AllUsersResponse _self;
  final $Res Function(_AllUsersResponse) _then;

/// Create a copy of AllUsersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creators = null,Object? businesses = null,}) {
  return _then(_AllUsersResponse(
creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as List<UserContainer>,businesses: null == businesses ? _self._businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<UserContainer>,
  ));
}


}

// dart format on
