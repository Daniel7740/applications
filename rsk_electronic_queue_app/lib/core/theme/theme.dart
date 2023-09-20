import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';

class Themes {
  /// Light Theme
  static final light = ThemeData.light().copyWith(
    useMaterial3: true,

    // Scaffold background color
    scaffoldBackgroundColor: AppColors.background,

    // Text theme
    textTheme: const TextTheme(
      displaySmall: AppTextStyles.style32w500,
      headlineMedium: AppTextStyles.style28w500,
      headlineSmall: AppTextStyles.style20w400,
      titleLarge: AppTextStyles.style16w600,
      titleMedium: AppTextStyles.style16w400,
      labelLarge: AppTextStyles.style14w500,
      labelMedium: AppTextStyles.style14w400,
      bodyLarge: AppTextStyles.style12w500,
      bodyMedium: AppTextStyles.style12w400,
      bodySmall: AppTextStyles.style12w300,
    ),

    // Colors scheme
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: AppColors.background,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      shadow: AppColors.shadow,
      scrim: AppColors.scrim,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      inversePrimary: AppColors.inversePrimary,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      surfaceTint: AppColors.surfaceTint,
      surfaceVariant: AppColors.surfaceVariant,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      onErrorContainer: AppColors.onErrorContainer,
    ),
  );

  /// Dark Theme
  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,

    // Scaffold background color
    scaffoldBackgroundColor: const Color(0xFF000000),

    // Text theme
    textTheme: const TextTheme(
      displaySmall: AppTextStyles.style32w500,
      headlineMedium: AppTextStyles.style28w500,
      headlineSmall: AppTextStyles.style20w400,
      titleLarge: AppTextStyles.style16w600,
      titleMedium: AppTextStyles.style16w400,
      labelLarge: AppTextStyles.style14w500,
      labelMedium: AppTextStyles.style14w400,
      bodyLarge: AppTextStyles.style12w500,
      bodyMedium: AppTextStyles.style12w400,
      bodySmall: AppTextStyles.style12w300,
    ),

    // Colors scheme
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
    ),
  );
}
