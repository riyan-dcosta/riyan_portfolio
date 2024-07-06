import 'package:flutter/material.dart' show TextStyle, TextTheme;

class AppTextTheme {
  static const String _inter = "Inter";
  static const TextStyle _basicTextStyle = TextStyle(fontFamily: _inter);
  static const TextTheme textTheme = TextTheme(
    bodyLarge: _basicTextStyle,
    bodyMedium: _basicTextStyle,
    bodySmall: _basicTextStyle,
    titleSmall: _basicTextStyle,
    titleMedium: _basicTextStyle,
    titleLarge: _basicTextStyle,
    labelSmall: _basicTextStyle,
    labelMedium: _basicTextStyle,
    labelLarge: _basicTextStyle,
    displaySmall: _basicTextStyle,
    displayMedium: _basicTextStyle,
    displayLarge: _basicTextStyle,
    headlineLarge: _basicTextStyle,
    headlineMedium: _basicTextStyle,
    headlineSmall: _basicTextStyle,
  );
}
