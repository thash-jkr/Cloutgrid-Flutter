import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart'; // UserContainer

part 'search_models.freezed.dart';
part 'search_models.g.dart';

@freezed
abstract class AllUsersResponse with _$AllUsersResponse {
  const factory AllUsersResponse({
    required List<UserContainer> creators,
    required List<UserContainer> businesses,
  }) = _AllUsersResponse;

  factory AllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseFromJson(json);
}
