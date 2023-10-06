import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xffF4F6FD),
      textTheme: const TextTheme(),
      colorScheme: const ColorScheme.light(
        primary: Color(0xff0A155A),
        onPrimary: Color(0xff3450A1),
        secondary: Color(0xffA056C5),
      ));

  static final dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xff3450A1),
      textTheme: const TextTheme(),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff0A155A),
        onPrimary: Color(0xff3450A1),
        secondary: Color(0xffD103FC),
      ));
}
