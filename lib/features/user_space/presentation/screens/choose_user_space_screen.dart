import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/features/user_space/presentation/widgets/space_container.dart';
import 'package:flutter/material.dart';

class ChooseUserSpaceScreen extends StatelessWidget {
  const ChooseUserSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: screenHeight * 0.02,
          children: [
            SpaceContainer(),
            SpaceContainer(),
          ],
        ),
      ),
    );
  }
}

