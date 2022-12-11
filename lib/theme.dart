// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qfoumn/constants/colors.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsConstant.backgroundColor,
      primarySwatch: buildMaterialColor(ColorsConstant.primaryColor),
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      textSelectionTheme: textSelectionThemeData());
}

TextSelectionThemeData textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: ColorsConstant.darkPrimaryColor, //<-- SEE HERE
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: ColorsConstant.darkPrimaryColor),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: ColorsConstant.darkPrimaryColor,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      filled: true,
      fillColor: ColorsConstant.primaryColor,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: ColorsConstant.darkPrimaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: ColorsConstant.darkPrimaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ));
}

// ========================================================================
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
