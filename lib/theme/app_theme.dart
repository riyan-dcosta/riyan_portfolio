import 'package:flutter/material.dart';

class AppTheme {
  ThemeData light() {
    return ThemeData(actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) {
        return const Icon(Icons.arrow_back);
      },
    ),
      adaptations: null,
      appBarTheme: AppBarTheme(),
    );
  }
}
