// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanController)
const scanControllerProvider = ScanControllerProvider._();

final class ScanControllerProvider
    extends $NotifierProvider<ScanController, ScanState> {
  const ScanControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanControllerHash();

  @$internal
  @override
  ScanController create() => ScanController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanState>(value),
    );
  }
}

String _$scanControllerHash() => r'ceed973cc616d02063688e915b70cf09f40a8520';

abstract class _$ScanController extends $Notifier<ScanState> {
  ScanState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ScanState, ScanState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScanState, ScanState>,
              ScanState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ScanOptions)
const scanOptionsProvider = ScanOptionsProvider._();

final class ScanOptionsProvider
    extends $NotifierProvider<ScanOptions, RecipeOptions> {
  const ScanOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanOptionsHash();

  @$internal
  @override
  ScanOptions create() => ScanOptions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeOptions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeOptions>(value),
    );
  }
}

String _$scanOptionsHash() => r'39d300982c2415f359fa7dd90730c3f7ac52a241';

abstract class _$ScanOptions extends $Notifier<RecipeOptions> {
  RecipeOptions build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RecipeOptions, RecipeOptions>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecipeOptions, RecipeOptions>,
              RecipeOptions,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
