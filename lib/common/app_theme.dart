import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    dividerColor: AppColors.lightPrimary,
    dividerTheme: DividerThemeData(color: AppColors.lightPrimary),
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      brightness: Brightness.light,
      surface: AppColors.lightBackground,
      onSurface: AppColors.lightText,
      secondary: AppColors.lightPrimary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightText,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.lightText,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.lightText,
      unselectedLabelColor: AppColors.lightText,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    dividerColor: AppColors.lightPrimary,
    dividerTheme: DividerThemeData(color: AppColors.lightPrimary),
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimary,
      brightness: Brightness.dark,
      surface: AppColors.darkBackground,
      onSurface: AppColors.darkText,
      secondary: AppColors.darkPrimary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkText,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.darkText,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.darkText,
      unselectedLabelColor: AppColors.darkText,
    ),
  );
}