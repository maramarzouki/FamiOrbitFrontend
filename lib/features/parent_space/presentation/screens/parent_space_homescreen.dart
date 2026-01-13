import 'package:fami_orbit/core/models/child.dart';
import 'package:fami_orbit/core/services/auth_service.dart';
import 'package:fami_orbit/core/services/child_service.dart';
import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:fami_orbit/core/validators/validators.dart';
import 'package:fami_orbit/core/widgets/custom_button.dart';
import 'package:fami_orbit/core/widgets/custom_input.dart';
import 'package:fami_orbit/core/widgets/custom_list_view.dart';
import 'package:fami_orbit/features/parent_space/presentation/screens/child_details.dart';
import 'package:fami_orbit/features/parent_space/presentation/widgets/child_card.dart';
import 'package:flutter/material.dart';

class ParentSpaceHomescreen extends StatefulWidget {
  const ParentSpaceHomescreen({super.key});

  @override
  State<ParentSpaceHomescreen> createState() => _ParentSpaceHomescreenState();
}

class _ParentSpaceHomescreenState extends State<ParentSpaceHomescreen> {
  final _addChildFormKey = GlobalKey<FormState>();
  final _addPhoneNumberFormKey = GlobalKey<FormState>();

  final TextEditingController childUsernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final _validators = Validators();
  String errorMessage = "";

  String parentID = "";
  List<Child> childrenList = [];

  @override
  void initState() {
    super.initState();
    getChildrenList();
  }

  Future<void> addChild(StateSetter setDialogState) async {
    parentID = await AuthService.instance.userId;
    Child child = Child(
      childUsername: childUsernameController.text,
      parentID: parentID,
    );
    debugPrint("$child");
    if (_addChildFormKey.currentState!.validate()) {
      try {
        final result = await ChildService.addChild(child);
        debugPrint("add child Success: $result");
        Navigator.pop(context);
      } catch (e) {
        final errorMsg = e.toString().replaceAll('Exception: ', '');
        setDialogState(() {
          errorMessage = errorMsg;
        });
        debugPrint("Error: ${e.toString()}");
        debugPrint("errorMessage $errorMessage");
      }
    }
  }

  Future<void> getChildrenList() async {
    parentID = await AuthService.instance.userId;
    final chList = await ChildService.getAllChildren(parentID);
    if (!mounted) return;
    setState(() {
      childrenList = chList;
    });
    debugPrint('children list $childrenList');
  }

  void showOTPDialog(childID, phoneNumber) {
    final TextEditingController otpController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Enter OTP sent to $phoneNumber'),
                  CustomInput(
                    label: "OTP",
                    controller: otpController,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                  ),
                  CustomButton(
                    text: "Verify",
                    onPressed: () async {
                      try {
                        await ChildService.verifyPhoneNumber(
                          childID,
                          phoneNumber,
                          otpController.text,
                        );
                        Navigator.pop(context);
                        getChildrenList(); // Refresh
                      } catch (e) {
                        // Show error
                      }
                    },
                    width: double.infinity,
                    height: 45,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> addPhoneNumber(
    StateSetter setDialogState,
    childID,
    phoneNumber,
  ) async {
    if (_addPhoneNumberFormKey.currentState!.validate()) {
      try {
        final result = await ChildService.addPhoneNumber(childID, phoneNumber);
        debugPrint("add child Success: $result");
        Navigator.pop(context);
        showOTPDialog(childID, phoneNumber);
      } catch (e) {
        final errorMsg = e.toString().replaceAll('Exception: ', '');
        setDialogState(() {
          errorMessage = errorMsg;
        });
        debugPrint("Error: ${e.toString()}");
        debugPrint("errorMessage $errorMessage");
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
            child: StatefulBuilder(
              builder:
                  (BuildContext dialogContext, StateSetter setDialogState) {
                    return Container(
                      padding: EdgeInsets.all(screenWidth * 0.07),
                      child: Form(
                        key: _addChildFormKey,
                        onChanged: () => setDialogState(() {
                          errorMessage = '';
                        }),
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
                              controller: childUsernameController,
                              maxLines: 1,
                              textInputType: TextInputType.text,
                              validator: _validators.defaultValidation,
                            ),
                            if (errorMessage.isNotEmpty)
                              Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            CustomButton(
                              width: double.infinity,
                              height: screenHeight * 0.05,
                              text: "Add",
                              onPressed: () async {
                                await addChild(setDialogState);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
            ),
          );
        },
      );
    }

    void openAddNewNumber(childID) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: StatefulBuilder(
              builder:
                  (BuildContext dialogContext, StateSetter setDialogState) {
                    return Container(
                      padding: EdgeInsets.all(screenWidth * 0.07),
                      child: Form(
                        key: _addPhoneNumberFormKey,
                        onChanged: () => setDialogState(() {
                          errorMessage = '';
                        }),
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
                              controller: phoneNumberController,
                              maxLines: 1,
                              textInputType: TextInputType.number,
                              validator: _validators.validatePhone,
                            ),
                            if (errorMessage.isNotEmpty)
                              Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            CustomButton(
                              width: double.infinity,
                              height: screenHeight * 0.05,
                              text: "Add",
                              onPressed: () => addPhoneNumber(
                                setDialogState,
                                childID,
                                phoneNumberController.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
              childrenList.isNotEmpty
                  ? CustomListView(
                      itemCount: childrenList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: screenHeight * .02),
                          child: Row(
                            spacing: screenWidth * 0.02,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ChildDetails(
                                          childID: childrenList[index].id!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: ChildCard(
                                    name: childrenList[index].childUsername,
                                    location: "location",
                                    batteryState: "Full",
                                  ),
                                ),
                              ),
                              CustomButton(
                                width: screenWidth * 0.12,
                                height: screenHeight * 0.05,
                                icon: Icons.local_phone_rounded,
                                onPressed: () =>
                                    openAddNewNumber(childrenList[index].id),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Text('No children added yet!'),
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
