// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qfoumn/constants/colors.dart';

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
// ======================================================================

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsConstant.scaffoldBackgroundColor,
      primarySwatch: buildMaterialColor(ColorsConstant.primaryColor),
      textTheme: textTheme(),
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: Colors.white,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: 34, letterSpacing: 0),
    headlineMedium: TextStyle(fontSize: 16, letterSpacing: 0),
    bodySmall: TextStyle(fontSize: 16, letterSpacing: 0),
    labelSmall: TextStyle(fontSize: 14, letterSpacing: 0),
    labelMedium:
        TextStyle(fontSize: 60, letterSpacing: 0, fontWeight: FontWeight.w600),
    titleLarge:
        TextStyle(fontSize: 40, letterSpacing: 0, fontWeight: FontWeight.w600),
    titleSmall:
        TextStyle(fontSize: 18, letterSpacing: 0, fontWeight: FontWeight.w600),
  );
}
