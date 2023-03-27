import 'package:flutter/material.dart';

abstract class Appearance {
  ThemeData get appTheme;

  Color get accentColor;

  Color get primaryButtonColor;

  TextStyle get appBarTitleTextStyle;

  TextStyle get subTitleTextStyle;

  TextStyle get heading6TextStyle;

  TextStyle get primaryButtonTextStyle;
}
