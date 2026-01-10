import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  final String name;
  final String location;
  final String batteryState;
  const ChildCard({
    super.key,
    required this.name,
    required this.location,
    required this.batteryState,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();

    return Container(
      width: double.infinity,
      height: screenHeight * 0.06,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Row(
            children: [
              Icon(Icons.pin_drop_rounded, size: screenWidth * 0.05),
              Text(location),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.battery_charging_full_rounded,
                size: screenWidth * 0.05,
              ),
              Text(batteryState),
            ],
          ),
        ],
      ),
    );
  }
}
