import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        outline:  AppColors.border,
        secondary: AppColors.accent,
        primaryContainer: AppColors.mint,
        onSurfaceVariant: AppColors.textSecondary,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );
  }
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: Colors.black,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
        outline:  AppColors.darkBorder,
        secondary: AppColors.darkAccent,
        primaryContainer: AppColors.darkMint,
        onSurfaceVariant: AppColors.darkTextSecondary,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
    );
  }
}