import 'package:flutter/material.dart';
import 'package:jokes/core/theme/app_colors.dart';
import 'package:jokes/core/theme/app_text_styles.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    ///
    textTheme: TextTheme(
      titleMedium: AppTextStyles.oswald20w600,
      displayMedium: AppTextStyles.oswald30w700,
      labelMedium: AppTextStyles.oswald16w600,
    ),

    ///
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,

    ///
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.3),
      toolbarHeight: 51,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),

    ///
    colorScheme: ColorScheme.fromSwatch().copyWith(
      // BoxShadow color
      shadow: AppColors.color000000.withOpacity(0.2),
      // border color
      outline: AppColors.color000000.withOpacity(0.2),
      // Containers color
      primaryContainer: AppColors.color000000,
      // SpinKitThreeBounce
      onPrimary: AppColors.colorffffff,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    ///
    textTheme: TextTheme(
      titleMedium:
          AppTextStyles.oswald20w600.copyWith(color: AppColors.colorFFD8D8),
      displayMedium:
          AppTextStyles.oswald30w700.copyWith(color: AppColors.colorFFD8D8),
      labelMedium:
          AppTextStyles.oswald16w600.copyWith(color: AppColors.colorFFD8D8),
    ),

    ///
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,

    ///
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.3),
      toolbarHeight: 51,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),

    ///
    colorScheme: ColorScheme.fromSwatch().copyWith(
      // BoxShadow color
      shadow: AppColors.colorffffff.withOpacity(0.2),
      // border color
      outline: AppColors.colorffffff.withOpacity(0.2),
      // Containers color
      primaryContainer: AppColors.colorffffff,
      // SpinKitThreeBounce
      onPrimary: AppColors.colorFFD8D8,
    ),
  );
}
