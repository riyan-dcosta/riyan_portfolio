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
    // headline1: _basicTextStyle,
    // button: _basicTextStyle,
    // bodyText1: _basicTextStyle,
    // bodyText2: _basicTextStyle,
    // caption: _basicTextStyle,
    // headline2: _basicTextStyle,
    // headline3: _basicTextStyle,
    // headline4: _basicTextStyle,
    // headline5: _basicTextStyle,
    // headline6: _basicTextStyle,
    // overline: _basicTextStyle,
    // subtitle1: _basicTextStyle,
    // subtitle2: _basicTextStyle,
  );
}
