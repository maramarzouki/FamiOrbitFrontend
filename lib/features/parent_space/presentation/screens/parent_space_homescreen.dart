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
      body: Column(
        children: [
          ChildCard(),
          CustomButton(width: screenWidth * 0.5, height: screenHeight * 0.04, onPressed: (){}, text: "New child space",)
        ],
      ),
    );
  }
}