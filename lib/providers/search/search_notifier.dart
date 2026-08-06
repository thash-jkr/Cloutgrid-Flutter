import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/auth/auth_models.dart';
import '../../models/search/search_models.dart';

part 'search_notifier.g.dart';

class SearchState {
  final List<UserContainer> suggestions;
  final List<UserContainer> results;
  final List<UserContainer> collabs;
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
    List<UserContainer>? suggestions,
    List<UserContainer>? results,
    List<UserContainer>? collabs,
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
          .request<AllUsersResponse>(
            '/users/',
            method: 'GET',
            fromJson: (json) => AllUsersResponse.fromJson(json),
            requireAuth: true,
          );

      final allUsers = [...response.creators, ...response.businesses];
      allUsers.shuffle(Random());

      state = state.copyWith(
        suggestions: allUsers.take(6).toList(),
        isLoading: false,
      );
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
          .request<List<UserContainer>>(
            '/search-business?q=$query',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => UserContainer.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(collabs: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
