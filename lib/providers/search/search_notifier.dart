import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/auth/auth_models.dart';
import '../../models/search/search_models.dart';

part 'search_notifier.g.dart';

class SearchState {
  final List<UserProfile> suggestions;
  final List<UserProfile> results;
  final List<UserProfile> collabs;
  final bool isLoading;
  final String? errorMessage;

  const SearchState({
    this.suggestions = const [],
    this.results = const [],
    this.collabs = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  SearchState copyWith({
    List<UserProfile>? suggestions,
    List<UserProfile>? results,
    List<UserProfile>? collabs,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return SearchState(
      suggestions: suggestions ?? this.suggestions,
      results: results ?? this.results,
      collabs: collabs ?? this.collabs,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchState build() => const SearchState();

  Future<void> fetchSuggestions() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final response = await ref
          .read(apiServiceProvider)
          .request<List<UserProfile>>(
            '/suggestions/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(suggestions: response, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> handleSearch(String query) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final response = await ref
          .read(apiServiceProvider)
          .request<AllUsersResponse>(
            '/search?q=$query',
            method: 'GET',
            fromJson: (json) => AllUsersResponse.fromJson(json),
            requireAuth: true,
          );

      final allUsers = [...response.creators, ...response.businesses];

      state = state.copyWith(results: allUsers, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> handleSearchBusiness(String query) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<UserProfile>>(
            '/search-business?q=$query',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(collabs: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
