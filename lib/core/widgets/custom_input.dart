import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final Color? color, iconColor, labelColor;
  final double? blurRadius, offset, iconSize;
  final IconData? prefixIcon;
  final bool? obsucreText;
  final TextInputType? textInputType;
  const CustomInput(
      {super.key,
      required this.label,
      required this.controller,
      required this.maxLines,
      this.validator,
      this.color,
      this.blurRadius,
      this.offset,
      this.prefixIcon,
      this.iconSize,
      this.iconColor,
      this.labelColor,
      this.obsucreText,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    final screenHeight = ScreenUtils.getScreenHeight();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color ?? Color(0xff7766C6).withValues(alpha: 0.2),
            blurRadius: blurRadius ?? 32,
            offset: Offset(0, offset ?? 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        obscureText: obsucreText ?? false,
        keyboardType: textInputType,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Color(0xff130F26), fontSize: screenWidth * 0.035),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: labelColor ?? Colors.grey,
                fontSize: screenWidth * 0.035),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06, vertical: screenHeight * 0.02),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: iconSize,
                    color: iconColor,
                  )
                : null),
        validator: validator,
        cursorHeight: screenHeight * 0.02,
        cursorWidth: 1,
        cursorRadius: Radius.circular(50),
        cursorColor: Color(0xff130F26),
      ),
    );
  }
}
