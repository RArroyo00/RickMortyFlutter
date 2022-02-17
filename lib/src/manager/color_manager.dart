import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color.fromARGB(255, 0, 176, 200);
  static Color primaryLight = const Color.fromARGB(255, 0, 224, 255);
  static Color primaryDark = const Color.fromARGB(255, 0, 156, 178);
  static Color accent = const Color.fromARGB(255, 128, 252, 102);
  static Color grey = Colors.grey;
  static Color lightGrey = Colors.grey.shade300;
  static Color darkGrey = Colors.grey.shade700;
  static Color white = Colors.white;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color dark = HexColor.fromHex('#990000');
  static Color black = Colors.black;
  static Color lime = const Color.fromARGB(255, 195, 217, 70);
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      // 100% Opacity
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
