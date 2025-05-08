// theme/app_theme.dart - Theme configuration
import 'package:flutter/material.dart';
import 'package:webportf/constants/app_color_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColorConstants.gray600),
    ),
  );

  // Using the color constants from AppColorConstants
  static const Color primaryColor = AppColorConstants.primaryPurple;
  static const Color secondaryColor = AppColorConstants.secondaryPurple;
}