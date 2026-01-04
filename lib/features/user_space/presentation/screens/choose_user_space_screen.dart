import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/features/user_space/presentation/widgets/space_container_widget.dart';
import 'package:flutter/material.dart';

class ChooseUserSpaceScreen extends StatefulWidget {
  const ChooseUserSpaceScreen({super.key});

  @override
  State<ChooseUserSpaceScreen> createState() => _ChooseUserSpaceScreenState();
}

class _ChooseUserSpaceScreenState extends State<ChooseUserSpaceScreen> {
  String? selectedSpace;
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
          spacing: screenHeight * 0.02,
          children: [
            SpaceContainerWidget(
              type: "Parent",
              isSelected: selectedSpace == "Parent",
              onTap: () {
                setState(() {
                  selectedSpace = selectedSpace == "Parent" ? null : "Parent";
                });
              },
            ),
            SpaceContainerWidget(
              type: "Child",
              isSelected: selectedSpace == "Child",
              onTap: () {
                setState(() {
                  selectedSpace = selectedSpace == "Child" ? null : "Child";
                });
              },
            ),
            CustomButton(
              width: screenWidth * 0.5,
              height: screenHeight * 0.05,
              onPressed: () {},
              text: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
