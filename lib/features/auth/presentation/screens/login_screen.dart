import 'package:fami_orbit/core/providers/modal_state_provider.dart';
import 'package:fami_orbit/core/services/user_service.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/validators/validators.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/core/widgets/custom_input.dart';
import 'package:fami_orbit/features/auth/data/model/user.dart';
import 'package:fami_orbit/features/choose_space/presentation/screens/choose_user_space_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _validators = Validators();
  String errorMessage = "";

  Future<void> loginUser() async {
    User user = User(
      email: emailController.text,
      password: passwordController.text,
    );
    debugPrint("user (loginUser): $user");
    if (_loginFormKey.currentState!.validate()) {
      try {
        final result = await UserService.login(user);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChooseUserSpaceScreen()),
        );
        debugPrint("Signin Success: $result");
      } catch (e) {
        final errorMsg = e.toString().replaceAll('Exception: ', '');
        setState(() {
          errorMessage = errorMsg;
        });
        debugPrint("Error: ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: screenHeight * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // spacing: screenHeight * 0.04,
        children: [
          Text(
            "Welcome back!",
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
              key: _loginFormKey,
              child: Column(
                spacing: screenHeight * 0.02,
                children: [
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
                  if (errorMessage.isNotEmpty)
                  Text("$errorMessage", style: TextStyle(color: Colors.red)),
                  CustomButton(
                    width: screenWidth * 1,
                    height: screenHeight * 0.055,
                    color: Color(0xff060B21),
                    text: "Login",
                    textColor: Color(0xffC9A973),
                    textSize: screenWidth * 0.045,
                    onPressed: loginUser,
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
                "Don't have an account? ",
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
                  ref.read(modalStateProvider.notifier).setPendingModal('register');
                  Navigator.pop(context);
                },
                child: Text(
                  "Register here.",
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
    );
  }
}
