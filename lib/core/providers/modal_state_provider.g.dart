// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModalStateNotifier)
const modalStateProvider = ModalStateNotifierProvider._();

final class ModalStateNotifierProvider
    extends $NotifierProvider<ModalStateNotifier, ModalState> {
  const ModalStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modalStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modalStateNotifierHash();

  @$internal
  @override
  ModalStateNotifier create() => ModalStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModalState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModalState>(value),
    );
  }
}

String _$modalStateNotifierHash() =>
    r'8346304c8c5a7d661c6dff116f68cbf23f19f9d6';

abstract class _$ModalStateNotifier extends $Notifier<ModalState> {
  ModalState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ModalState, ModalState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModalState, ModalState>,
              ModalState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
