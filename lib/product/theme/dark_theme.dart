import 'package:flutter/material.dart';
import 'package:postapp/product/constants/color_constants.dart';
import 'package:postapp/product/constants/font_constants.dart';

/// DarkTheme class
final class CustomDarkTheme {
  CustomDarkTheme._();

  /// App's main dark theme data
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    colorScheme: const ColorScheme.dark(
      primary: ColorConstants.defaultBlue,
      background: Color(0xFF1c2125),
      surface: Color(0xFF272c30),
      outline: Color(0XFF9F9F9E),
    ),
    canvasColor: Colors.transparent,
    fontFamily: FontConstants.inter,
  );
}
