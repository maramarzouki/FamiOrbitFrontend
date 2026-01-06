import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/features/parent_space/presentation/widgets/child_card.dart';
import 'package:flutter/material.dart';

class ParentSpaceHomescreen extends StatelessWidget {
  const ParentSpaceHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            spacing: screenHeight * 0.02,
            children: [
              ChildCard(),
              CustomButton(
                width: screenWidth * 0.45,
                height: screenHeight * 0.045,
                onPressed: () {},
                text: "New child space",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
