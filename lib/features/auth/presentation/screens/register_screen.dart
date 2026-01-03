import 'package:fami_orbit/core/providers/modal_state_provider.dart';
import 'package:fami_orbit/core/services/user_service.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/validators/validators.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/core/widgets/custom_input.dart';
import 'package:fami_orbit/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _validators = Validators();
  String errorMessage = "";

  Future<void> registerUser() async {
    User user = User(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (_registerFormKey.currentState!.validate()) {
      try {
        final result = await UserService.register(user);
        ref.read(modalStateProvider.notifier).setPendingModal('login');
        debugPrint("Signup Success: $result");
        Navigator.pop(context);
      } catch (e) {
        final errorMsg = e.toString().replaceAll('Exception: ', '');
        setState(() {
          errorMessage = errorMsg;
        });
        debugPrint("Error: ${e.toString()}");
      }
    }
  }

  // Future<void> _openLoginModal(BuildContext context) async {
  //   setState(() {
  //     isLoginModalOpen = true;
  //   });

  //   // wait until the modal is closed (by swipe, tapping outside, back button, or Navigator.pop)
  //   await showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     enableDrag: false,
  //     barrierColor: Colors.transparent,
  //     backgroundColor: Colors.transparent,
  //     builder: (_) => const LoginScreen(),
  //   );

  //   // ensure widget still mounted before calling setState
  //   if (!mounted) return;
  //   setState(() {
  //     isLoginModalOpen = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return SingleChildScrollView(
      reverse: true,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        height: screenHeight * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Get started!",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xff060B21),
                letterSpacing: screenWidth * 0.025,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.04,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.01),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  spacing: screenHeight * 0.02,
                  children: [
                    CustomInput(
                      label: "Username",
                      controller: usernameController,
                      maxLines: 1,
                      prefixIcon: Icons.person_outline_rounded,
                      iconSize: screenWidth * 0.05,
                      iconColor: Color(0xff060B25),
                      labelColor: Color(0xffB3B3B3),
                      blurRadius: 0,
                      validator: _validators.defaultValidation,
                    ),
                    CustomInput(
                      label: "Email",
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      maxLines: 1,
                      prefixIcon: Icons.email_outlined,
                      iconSize: screenWidth * 0.05,
                      iconColor: Color(0xff060B25),
                      labelColor: Color(0xffB3B3B3),
                      blurRadius: 0,
                      validator: _validators.emailValidation,
                    ),
                    CustomInput(
                      label: "Password",
                      controller: passwordController,
                      obsucreText: true,
                      maxLines: 1,
                      prefixIcon: Icons.lock_outline_rounded,
                      iconSize: screenWidth * 0.05,
                      iconColor: Color(0xff060B25),
                      labelColor: Color(0xffB3B3B3),
                      blurRadius: 0,
                      validator: _validators.passwordValidation,
                    ),
                    CustomInput(
                      label: "Confirm password",
                      controller: confirmPasswordController,
                      obsucreText: true,
                      maxLines: 1,
                      prefixIcon: Icons.lock_outline_rounded,
                      iconSize: screenWidth * 0.05,
                      iconColor: Color(0xff060B25),
                      labelColor: Color(0xffB3B3B3),
                      blurRadius: 0,
                      validator: (value) {
                        return _validators.passwordConfirmationValidation(
                          passwordController.text,
                          value,
                        );
                      },
                    ),
                    if (errorMessage.isNotEmpty)
                      Text(errorMessage, style: TextStyle(color: Colors.red)),
                    CustomButton(
                      width: screenWidth * 1,
                      height: screenHeight * 0.055,
                      color: Color(0xff060B21),
                      text: "Register",
                      textColor: Color(0xffC9A973),
                      textSize: screenWidth * 0.045,
                      onPressed: registerUser,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account already?",
                  style: TextStyle(
                    color: Color(0xff060B21),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => LoginScreen()),
                    // );
                    ref
                        .read(modalStateProvider.notifier)
                        .setPendingModal('login');
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffC9A973),
                      decoration: TextDecoration.underline,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
