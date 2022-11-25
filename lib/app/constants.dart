import 'package:flutter/material.dart';

class AppColors {
  static final MaterialColor primarySwatch =
      MaterialColor(primary.value, _primarySwatch);
  static const primary = Color(0xff0d307a);
  static const secondary = Color(0xffa00d37);

  static const _primarySwatch = <int, Color>{
    50: Color(0xffe6e8f2),
    100: Color(0xffbfc6e0),
    200: Color(0xff95a2cb),
    300: Color(0xff6c7eb6),
    400: Color(0xff4c63a8),
    500: Color(0xff284a9a),
    600: Color(0xff224291),
    700: Color(0xff173986),
    800: Color(0xff0d307a),
    900: Color(0xff001f64),
  };
}
