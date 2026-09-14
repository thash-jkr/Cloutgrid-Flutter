import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart';

part 'search_models.freezed.dart';
part 'search_models.g.dart';

@freezed
abstract class AllUsersResponse with _$AllUsersResponse {
  const factory AllUsersResponse({
    required List<UserProfile> creators,
    required List<UserProfile> businesses,
  }) = _AllUsersResponse;

  factory AllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseFromJson(json);
}
