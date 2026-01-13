import 'package:fami_orbit/core/models/child.dart';
import 'package:fami_orbit/core/services/child_service.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ChildDetails extends StatefulWidget {
  final String childID;
  const ChildDetails({super.key, required this.childID});

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  final screenWidth = ScreenUtils.getScreenWidth();
  final screenHeight = ScreenUtils.getScreenHeight();

  Child child = Child(childUsername: "", parentID: "");

    @override
  void initState() {
    super.initState();
    getChildDetails();
  }


  Future<void> getChildDetails() async {
    try {
      final result = await ChildService.getChildDetails(widget.childID);
      setState(() {
        child = result;
      });
      debugPrint("add child Success: $child");
      Navigator.pop(context);
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: screenHeight * 0.05,
          children: [
            Text(child.childUsername),
            Text("numbers"),
            CustomButton(
              width: screenWidth * 0.4,
              height: 0.05,
              onPressed: () {},
              text: "Edit child",
            ),
            CustomButton(
              width: screenWidth * 0.4,
              height: 0.05,
              onPressed: () {},
              text: "Delete child",
            ),
          ],
        ),
      ),
    );
  }
}
