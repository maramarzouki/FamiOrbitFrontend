import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }
}

extension ColorExt on Color {
  /// Only replaces the channels you explicitly specify.
  Color withValues({
    double? alpha,
    double? red,
    double? green,
    double? blue,
  }) {
    return Color.fromARGB(
      alpha != null ? (alpha * 255).clamp(0, 255).toInt() : this.alpha,
      red != null ? (red * 255).clamp(0, 255).toInt() : this.red,
      green != null ? (green * 255).clamp(0, 255).toInt() : this.green,
      blue != null ? (blue * 255).clamp(0, 255).toInt() : this.blue,
    );
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return "";
    return this[0].toUpperCase() + substring(1);
  }
}
