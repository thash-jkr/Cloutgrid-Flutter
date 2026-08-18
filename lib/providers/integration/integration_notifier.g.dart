// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IntegrationNotifier)
final integrationProvider = IntegrationNotifierProvider._();

final class IntegrationNotifierProvider
    extends $NotifierProvider<IntegrationNotifier, IntegrationState> {
  IntegrationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'integrationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$integrationNotifierHash();

  @$internal
  @override
  IntegrationNotifier create() => IntegrationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IntegrationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IntegrationState>(value),
    );
  }
}

String _$integrationNotifierHash() =>
    r'1dfd15ed4ae5e286c63c0f1410788fbeeaabb6d0';

abstract class _$IntegrationNotifier extends $Notifier<IntegrationState> {
  IntegrationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<IntegrationState, IntegrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IntegrationState, IntegrationState>,
              IntegrationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
