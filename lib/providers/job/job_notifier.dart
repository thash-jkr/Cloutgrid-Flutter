import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../models/job/job_models.dart';

part 'job_notifier.g.dart';

class JobState {
  final List<JobModel> jobs;
  final List<ApplicationModel> applications;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  const JobState({
    this.jobs = const [],
    this.applications = const [],
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  JobState copyWith({
    List<JobModel>? jobs,
    List<ApplicationModel>? applications,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
    String? successMessage,
    bool clearSuccessMessage = false,
  }) {
    return JobState(
      jobs: jobs ?? this.jobs,
      applications: applications ?? this.applications,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
      successMessage: clearSuccessMessage
          ? null
          : (successMessage ?? this.successMessage),
    );
  }
}

// NOTE: Kotlin's CollabManager also exposes `user`/`type` derived from
// AuthRepository for convenience — not replicated here. Screens using this
// notifier should read authProvider directly (same call as elsewhere in
// this codebase) rather than duplicating that reference.
@Riverpod(keepAlive: true)
class JobNotifier extends _$JobNotifier {
  @override
  JobState build() => const JobState();

  Future<void> fetchJobs() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<JobModel>>(
            '/jobs/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(jobs: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchBusinessJobs() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<JobModel>>(
            '/jobs/my-jobs/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(jobs: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchApplications(JobModel job) async {
    state = state.copyWith(
      applications: const [],
      isLoading: true,
      clearErrorMessage: true,
    );

    try {
      final results = await ref
          .read(apiServiceProvider)
          .request<List<ApplicationModel>>(
            '/jobs/my-jobs/${job.id}/',
            method: 'GET',
            fromJson: (json) => (json as List)
                .map(
                  (e) => ApplicationModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
            requireAuth: true,
          );

      state = state.copyWith(applications: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  /// Returns true on success, false on failure or validation error —
  /// return-value equivalent of Kotlin's Channel<Boolean> events.
  Future<bool> createJob({
    required String title,
    required String description,
    required String requirements,
    required String targetCreator,
    required List<String> questions,
  }) async {
    if (title.isEmpty ||
        description.isEmpty ||
        requirements.isEmpty ||
        targetCreator.isEmpty) {
      state = state.copyWith(errorMessage: 'Please fill in all fields');
      return false;
    }

    state = state.copyWith(
      isLoading: true,
      clearErrorMessage: true,
      clearSuccessMessage: true,
    );

    try {
      await ref
          .read(apiServiceProvider)
          .multipartRequest<dynamic>(
            '/jobs/',
            method: 'POST',
            fromJson: (json) => json,
            imageBytes: null,
            imageKey: null,
            params: {
              'title': title,
              'description': description,
              'requirements': requirements,
              'target_creator': targetCreator,
              'questions': jsonEncode(questions),
            },
            requireAuth: true,
          );

      state = state.copyWith(
        successMessage: 'Collaboration Created',
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      return false;
    }
  }

  Future<bool> deleteJob(int id) async {
    state = state.copyWith(clearErrorMessage: true, clearSuccessMessage: true);

    try {
      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/jobs/$id/',
            method: 'DELETE',
            fromJson: (json) => json,
            requireAuth: true,
          );

      state = state.copyWith(
        jobs: state.jobs.where((j) => j.id != id).toList(),
        applications: const [],
        successMessage: 'Collaboration Deleted',
      );
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  Future<bool> submitApplication(int id, Map<int, String> answers) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final stringKeyedAnswers = answers.map(
        (key, value) => MapEntry(key.toString(), value),
      );

      await ref
          .read(apiServiceProvider)
          .request<dynamic>(
            '/jobs/$id/apply/',
            method: 'POST',
            fromJson: (json) => json,
            body: {'answers': stringKeyedAnswers},
            requireAuth: true,
          );

      state = state.copyWith(
        jobs: state.jobs.map((j) {
          if (j.id != id) return j;
          return j.copyWith(isApplied: true);
        }).toList(),
        successMessage: 'Application submitted',
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      return false;
    }
  }
}
