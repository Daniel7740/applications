import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xffF4F6FD),
      textTheme: const TextTheme(),
      colorScheme: const ColorScheme.light());

  static final dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xff3450A1),
      textTheme: const TextTheme(),
      colorScheme: const ColorScheme.dark());
}
