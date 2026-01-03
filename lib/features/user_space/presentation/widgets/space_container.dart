import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class SpaceContainer extends StatelessWidget {
  const SpaceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Container(
      height: screenHeight * 0.2,
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
        // border: Border.all(color: Color(0xffC9A973),width: screenWidth * 0.002),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/parents.png',
        width: 135,
        height: 135,
        fit: BoxFit.contain,
      ),
    );
  }
}
