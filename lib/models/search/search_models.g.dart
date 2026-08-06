// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllUsersResponse _$AllUsersResponseFromJson(Map<String, dynamic> json) =>
    _AllUsersResponse(
      creators: (json['creators'] as List<dynamic>)
          .map((e) => UserContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      businesses: (json['businesses'] as List<dynamic>)
          .map((e) => UserContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllUsersResponseToJson(_AllUsersResponse instance) =>
    <String, dynamic>{
      'creators': instance.creators,
      'businesses': instance.businesses,
    };
