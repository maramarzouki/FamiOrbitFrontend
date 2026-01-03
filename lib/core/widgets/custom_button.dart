import 'package:fami_orbit/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width, height;
  final String? text;
  final IconData? icon;
  final Color? color, textColor;
  final double? blurRadius, offset, textSize, elevation;
  final VoidCallback onPressed;
  final bool? showBoxShadow;
  const CustomButton(
      {super.key,
      required this.width,
      required this.height,
      this.text,
      required this.onPressed,
      this.icon,
      this.color,
      this.textColor,
      this.blurRadius,
      this.offset,
      this.textSize,
      this.showBoxShadow,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth();
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          if (showBoxShadow == true)
            BoxShadow(
              color: color?.withValues(alpha: .3) ??
                  Color(0xff7766C6).withValues(alpha: .3),
              blurRadius: blurRadius ?? 32,
              offset: Offset(0, offset ?? -5),
            ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: color ?? Color(0xff7766C6),
            elevation: elevation),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: textColor ?? Colors.white,
                    fontSize: textSize ?? screenWidth * 0.04,
                    fontWeight: FontWeight.bold)),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(
                icon,
                color: Colors.white,
                size: screenWidth * 0.05,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
