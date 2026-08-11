// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JobNotifier)
final jobProvider = JobNotifierProvider._();

final class JobNotifierProvider
    extends $NotifierProvider<JobNotifier, JobState> {
  JobNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jobProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jobNotifierHash();

  @$internal
  @override
  JobNotifier create() => JobNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JobState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JobState>(value),
    );
  }
}

String _$jobNotifierHash() => r'68d04f88b3c760f43c7949868275683015ab2fb7';

abstract class _$JobNotifier extends $Notifier<JobState> {
  JobState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<JobState, JobState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<JobState, JobState>,
              JobState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
