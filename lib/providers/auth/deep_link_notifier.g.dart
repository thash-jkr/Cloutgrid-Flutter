// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeepLinkNotifier)
final deepLinkProvider = DeepLinkNotifierProvider._();

final class DeepLinkNotifierProvider
    extends $NotifierProvider<DeepLinkNotifier, DeepLinkState> {
  DeepLinkNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deepLinkProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deepLinkNotifierHash();

  @$internal
  @override
  DeepLinkNotifier create() => DeepLinkNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeepLinkState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeepLinkState>(value),
    );
  }
}

String _$deepLinkNotifierHash() => r'd3ae7c89615d5db88e05e2af6738afc23e7b1628';

abstract class _$DeepLinkNotifier extends $Notifier<DeepLinkState> {
  DeepLinkState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DeepLinkState, DeepLinkState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeepLinkState, DeepLinkState>,
              DeepLinkState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
