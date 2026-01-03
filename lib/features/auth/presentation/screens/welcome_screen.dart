import 'dart:ui';
import 'package:fami_orbit/core/providers/modal_state_provider.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/features/auth/presentation/screens/login_screen.dart';
import 'package:fami_orbit/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  Future<void> openLoginModal(BuildContext context, WidgetRef ref) async {
    debugPrint(
      'pending modal value from login modal: ${ref.read(modalStateProvider).pendingModal}',
    );
    // ref.read(modalStateProvider.notifier).setPendingModal(null);
    ref.read(modalStateProvider.notifier).setLoginOpen(true);
    // setState(() {
    //   isLoginModalOpen = true;
    // });

    // wait until the modal is closed (by swipe, tapping outside, back button, or Navigator.pop)
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      // builder: (_) => const LoginScreen(),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: const LoginScreen(),
      ),
    );

    // ensure widget still mounted before calling setState
    if (!context.mounted) return;
    ref.read(modalStateProvider.notifier).setLoginOpen(false);
    // setState(() {
    //   isLoginModalOpen = false;
    // });

    final pending = ref.read(modalStateProvider).pendingModal;
    ref.read(modalStateProvider.notifier).setPendingModal('null');
    if (pending == 'register') {
      await openRegisterModal(context, ref);
    }
  }

  // make this async and await the modal Future
  Future<void> openRegisterModal(BuildContext context, WidgetRef ref) async {
    debugPrint(
      'pending modal value from register modal: ${ref.read(modalStateProvider).pendingModal}',
    );
    // ref.read(modalStateProvider.notifier).setPendingModal(null);
    ref.read(modalStateProvider.notifier).setRegisterOpen(true);
    // setState(() {
    //   isRegisterModalOpen = true;
    // });

    // wait until the modal is closed (by swipe, tapping outside, back button, or Navigator.pop)
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      // builder: (_) => const RegisterScreen(),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: const RegisterScreen(),
      ),
    );

    // ensure widget still mounted before calling setState
    if (!context.mounted) return;
    ref.read(modalStateProvider.notifier).setRegisterOpen(false);
    // setState(() {
    //   isRegisterModalOpen = false;
    // });
    final pending = ref.read(modalStateProvider).pendingModal;
    ref.read(modalStateProvider.notifier).setPendingModal('null'); // Reset
    if (pending == 'login') {
      await openLoginModal(context, ref);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isRegisterModalOpen = false;

    // bool isLoginModalOpen = false;

    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    final modalState = ref.watch(modalStateProvider);
    final isRegisterModalOpen = modalState.isRegisterOpen;
    final isLoginModalOpen = modalState.isLoginOpen;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
              child: Image.asset(
                'assets/images/starry_bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned.fill(
          //   child: Container(color: Colors.black.withValues(alpha: .25)),
          // ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenWidth * 0.00,
                bottom: screenWidth * 0.00,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: !(isRegisterModalOpen || isLoginModalOpen)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: screenHeight * 0.05,
                      children: [
                        Text(
                          "Let't get your mind at ease!",
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(color: Color(0xffC9A973)),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "No more worries, just peace of mind!\n Sign up for Trackid now!",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          spacing: screenHeight * 0.01,
                          children: [
                            CustomButton(
                              width: screenWidth * 0.7,
                              height: screenHeight * 0.06,
                              color: Color(0xff060B21),
                              text: "Register",
                              textColor: Color(0xffC9A973),
                              textSize: screenWidth * 0.05,
                              onPressed: () => openRegisterModal(context, ref),
                            ),
                            CustomButton(
                              width: screenWidth * 0.7,
                              height: screenHeight * 0.06,
                              color: Color(0xffC9A973),
                              text: "Login",
                              textColor: Color(0xff060B21),
                              textSize: screenWidth * 0.05,
                              onPressed: () => openLoginModal(context, ref),
                            ),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(height: screenHeight * 1, width: screenWidth * 1),
            ),
          ),
        ],
      ),
    );
  }
}
