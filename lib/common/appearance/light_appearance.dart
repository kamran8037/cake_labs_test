import 'package:flutter/material.dart';

import 'appearance.dart';

class LightAppearance extends Appearance {
  static const teal = Colors.teal;

  @override
  ThemeData get appTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
    );
  }

  @override
  Color get accentColor => const Color(0xFFFFA800);

  @override
  Color get primaryButtonColor => accentColor;

  @override
  TextStyle get appBarTitleTextStyle => const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get subTitleTextStyle => const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get primaryButtonTextStyle => const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get heading6TextStyle => TextStyle(
        fontSize: 32,
        color: accentColor,
        fontWeight: FontWeight.w700,
      );
}
