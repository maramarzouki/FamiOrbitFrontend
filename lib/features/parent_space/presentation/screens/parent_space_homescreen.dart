import 'package:fami_orbit/core/models/child.dart';
import 'package:fami_orbit/core/services/child_service.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/validators/validators.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/core/widgets/custom_input.dart';
import 'package:fami_orbit/features/parent_space/presentation/widgets/child_card.dart';
import 'package:flutter/material.dart';

class ParentSpaceHomescreen extends StatefulWidget {
  const ParentSpaceHomescreen({super.key});

  @override
  State<ParentSpaceHomescreen> createState() => _ParentSpaceHomescreenState();
}

class _ParentSpaceHomescreenState extends State<ParentSpaceHomescreen> {
  final _addChildFormKey = GlobalKey<FormState>();

  final TextEditingController childUsernameController = TextEditingController();

  final _validators = Validators();
  String errorMessage = "";


  Future<void> addChild() async {
    Child child = Child(
      childUsername: "",
      parentID: 0,
    );
    if (_addChildFormKey.currentState!.validate()) {
      try {
        final result = await ChildService.addChild(child);
        debugPrint("Signup Success: $result");
        Navigator.pop(context);
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


    void openAddChildDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.07),
              child: Form(
                key: _addChildFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: screenHeight * 0.02,
                  children: [
                    Text(
                      "Type child name",
                      style: TextStyle(fontSize: screenWidth * 0.05),
                    ),
                    CustomInput(
                      label: "Name",
                      controller: TextEditingController(),
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      validator: _validators.defaultValidation,
                    ),
                    CustomButton(
                      width: double.infinity,
                      height: screenHeight * 0.05,
                      text: "Add",
                      onPressed: addChild,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

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
                onPressed: () => openAddChildDialog(),
                text: "New child space",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
