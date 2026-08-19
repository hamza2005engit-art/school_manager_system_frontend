import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  //---------------------------------Light Theme---------------------------------
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // ضبط سمات الخطوط (TextTheme)
    textTheme: const TextTheme(
      headlineLarge: AppTextStyle.headLargeLight,
      headlineMedium: AppTextStyle.headRegularLight,
      bodyLarge: AppTextStyle.bodyLargeLight,
      bodyMedium: AppTextStyle.bodyRegularLight,
      labelLarge: AppTextStyle.labelRegularLight,
      labelSmall: AppTextStyle.labelSmallLight,
      labelMedium: AppTextStyle.onButtonLight
    ),

    // سمات الـ AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyle.headRegularLight,
    ),

    // سمات الـ TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFeildLight,
      hintStyle: AppTextStyle.bodyRegularLight.copyWith(color: AppColors.hintFontLIght),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),

    //Link
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryLight),//WidgetStateProperty for select state like hover error focused...
        textStyle: WidgetStateProperty.all(AppTextStyle.linkLight),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: WidgetStateProperty.all(AppColors.primaryLight.withOpacity(0.1)),
      ),
    ),

    // // سمات الأزرار (ElevatedButton)
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primaryLight,
    //     foregroundColor: Colors.white,
    //     textStyle: AppTextStyle.onMainButtonLight,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //   ),
    // ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondryLight,
      error: AppColors.errorLight,
      surface: AppColors.textFeildLight,

    ),
  );
  //---------------------------------Dark Theme---------------------------------
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // ضبط سمات الخطوط (TextTheme)
    textTheme: const TextTheme(
      headlineLarge: AppTextStyle.headLargeDark,
      headlineMedium: AppTextStyle.headRegularDark,
      bodyLarge: AppTextStyle.bodyLargeDark,
      bodyMedium: AppTextStyle.bodyRegularDark,
      labelLarge: AppTextStyle.labelRegularDark,
      labelSmall: AppTextStyle.labelSmallDark,
    ),

    // سمات الـ AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyle.headRegularDark,
    ),

    // سمات الـ TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFeildDark,
      hintStyle: AppTextStyle.bodyRegularDark.copyWith(color: AppColors.hintFontDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),

    // سمات الأزرار (ElevatedButton)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        textStyle: AppTextStyle.onMainButtonDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondryDark,
      error: AppColors.errorDark,
      surface: AppColors.textFeildDark,
    ),
  );
}