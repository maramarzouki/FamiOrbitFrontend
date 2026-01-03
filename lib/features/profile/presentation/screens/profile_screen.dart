import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/core/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    void openAddNewNumber() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.07),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: screenHeight * 0.02,
                children: [
                  Text(
                    "Type the new phone number",
                    style: TextStyle(fontSize: screenWidth * 0.05),
                  ),
                  CustomInput(
                    label: "Phone number",
                    controller: TextEditingController(),
                    maxLines: 1,
                    textInputType: TextInputType.number,
                  ),
                  CustomButton(
                    width: double.infinity,
                    height: screenHeight * 0.05,
                    text: "Add",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => openAddNewNumber(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
