import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modal_state_provider.g.dart';

//custom ModalState class for better type safety and integrated pendingModal into it

class ModalState {
  final bool isRegisterOpen;
  final bool isLoginOpen;
  final String? pendingModal; //acts as a "queue": Set it before popping a modal, then check/handle it after the modal closes to open the next one automatically.

  ModalState({
    this.isRegisterOpen = false,
    this.isLoginOpen = false,
    this.pendingModal,
  });

  ModalState copyWith({
    bool? isRegisterOpen,
    bool? isLoginOpen,
    String? pendingModal,
  }) {
    return ModalState(
      isRegisterOpen: isRegisterOpen ?? this.isRegisterOpen,
      isLoginOpen: isLoginOpen ?? this.isLoginOpen,
      pendingModal: pendingModal ?? this.pendingModal,
    );
  }
}

@riverpod
class ModalStateNotifier extends _$ModalStateNotifier {
  // @override
  // Map<String, bool> build() => {'isRegisterOpen': false, 'isLoginOpen': false};

  @override
  ModalState build() => ModalState();

  void setRegisterOpen(bool value) {
    state = state.copyWith(
      isRegisterOpen: value,
      isLoginOpen: false
    );
  }

  void setLoginOpen(bool value) {
    state = state.copyWith(
      isLoginOpen: value,
      isRegisterOpen: false
    );
  }

  void setPendingModal(String? value) {
    state = state.copyWith(pendingModal: value);
  }
}

  // void setRegisterOpen(bool value) {
  //   if (value) {
  //     state = {...state, 'isRegisterOpen': true, 'isLoginOpen': false};
  //   } else {
  //     state = {...state, 'isRegisterOpen': false};
  //   }
  // }

  // void setLoginOpen(bool value) {
  //   if (value) {
  //     state = {...state, 'isLoginOpen': true, 'isRegisterOpen': false};
  //   } else {
  //     state = {...state, 'isLoginOpen': false};
  //   }
  // }

