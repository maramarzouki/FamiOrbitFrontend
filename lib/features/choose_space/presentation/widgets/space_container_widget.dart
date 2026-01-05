// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fami_orbit/core/utils/screen_utils.dart';

class SpaceContainerWidget extends StatelessWidget {
  final String type;
  final bool isSelected;
  final VoidCallback onTap;
  const SpaceContainerWidget({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return InkWell(
      // onTap: () => setState(() {
      //   isSelected = !isSelected;
      // }),
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.5,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Theme.of(context).primaryColor, width: screenWidth * 0.003)
              : null,
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
        child: Column(
          spacing: screenHeight * 0.02,
          children: [
            type == "Parent"
                ? SizedBox(
                    height: 110,
                    width: 110,
                    child: Image.asset(
                      'assets/images/parents.png',
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox(
                    height: 105,
                    width: 105,
                    child: Image.asset(
                      'assets/images/child.png',
                      fit: BoxFit.contain,
                    ),
                  ),
            Text("$type Space"),
          ],
        ),
      ),
    );
  }
}
