// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateNotifier)
final createProvider = CreateNotifierProvider._();

final class CreateNotifierProvider
    extends $NotifierProvider<CreateNotifier, CreateState> {
  CreateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createNotifierHash();

  @$internal
  @override
  CreateNotifier create() => CreateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateState>(value),
    );
  }
}

String _$createNotifierHash() => r'ede8c3f9aa1e26d546037f81f24e259310b7b8c6';

abstract class _$CreateNotifier extends $Notifier<CreateState> {
  CreateState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CreateState, CreateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateState, CreateState>,
              CreateState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
