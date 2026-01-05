import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Container(
      width: double.infinity,
      height: screenHeight * 0.04,
      decoration: BoxDecoration(),
      child: Text("Child"),
    );
  }
}