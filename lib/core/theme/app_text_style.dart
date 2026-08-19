import 'package:flutter/material.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import 'package:student_project1/core/theme/app_fonts.dart';

class AppTextStyle {
  //---------------------------------Light Theme---------------------------------
  //Main Fonts
  static const TextStyle headLargeLight = TextStyle(
    color: AppColors.primaryLight,
    fontSize: AppFonts.headLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headLargeWeight,
  );
  static const TextStyle headRegularLight = TextStyle(
    color: AppColors.primaryLight,
    fontSize: AppFonts.headRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headRegularWeight,
  );
  static const TextStyle upNext = TextStyle(
      color: AppColors.upNextText,
      fontSize: AppFonts.labelSmallSize,
      fontWeight: AppFonts.headLargeWeight,
      fontFamily: AppFonts.fontName
  );
  static const TextStyle studentManagement = TextStyle(
    color: AppColors.primaryLight,
    fontSize: AppFonts.bodyLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyLargeWeight,
  );
  static const TextStyle bodyLargeLight = TextStyle(
    color: AppColors.bodyFontLight,
    fontSize: AppFonts.bodyLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyLargeWeight,
  );
  static const TextStyle bodyRegularLight = TextStyle(
    color: AppColors.bodyFontLight,
    fontSize: AppFonts.bodyRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyRegularWeight,
  );
  static const TextStyle labelRegularLight = TextStyle(
    color: AppColors.labelFontLight,
    fontSize: AppFonts.labelRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.labelRegularWeight,
  );
  static const TextStyle labelSmallLight = TextStyle(
    color: AppColors.labelFontLight,
    fontSize: AppFonts.labelSmallSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.labelSmallWeight,
  );
  //Others Fonts
  static const TextStyle onMainButtonLight = TextStyle(
    color: Colors.white,
    fontSize: AppFonts.bodyLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headLargeWeight,
  );
  static const TextStyle onButtonLight = TextStyle(
    color: Colors.white,
    fontSize: AppFonts.bodyRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyRegularWeight,
  );
  static const TextStyle linkLight = TextStyle(
    color: AppColors.primaryLight,
    decoration: TextDecoration.underline,
    fontSize: AppFonts.bodyLargeSize,
    fontWeight: AppFonts.bodyLargeWeight,
  );
  //---------------------------------Dark Theme---------------------------------
  static const TextStyle headLargeDark = TextStyle(
    color: AppColors.primaryDark,
    fontSize: AppFonts.headLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headLargeWeight,
  );
  static const TextStyle headRegularDark = TextStyle(
    color: AppColors.primaryDark,
    fontSize: AppFonts.headRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headRegularWeight,
  );
  static const TextStyle bodyLargeDark = TextStyle(
    color: AppColors.bodyFontDark,
    fontSize: AppFonts.bodyLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyLargeWeight,
  );
  static const TextStyle bodyRegularDark = TextStyle(
    color: AppColors.bodyFontDark,
    fontSize: AppFonts.bodyRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyRegularWeight,
  );
  static const TextStyle labelRegularDark = TextStyle(
    color: AppColors.labelFontDark,
    fontSize: AppFonts.labelRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.labelRegularWeight,
  );
  static const TextStyle labelSmallDark = TextStyle(
    color: AppColors.labelFontDark,
    fontSize: AppFonts.labelSmallSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.labelSmallWeight,
  );
  //Others Fonts
  static const TextStyle onMainButtonDark = TextStyle(
    color: Colors.white,
    fontSize: AppFonts.bodyLargeSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.headLargeWeight,
  );
  static const TextStyle linkDark = TextStyle(
    color: AppColors.primaryDark,
    decoration: TextDecoration.underline,
    fontSize: AppFonts.bodyLargeSize,
    fontWeight: AppFonts.bodyLargeWeight,
  );

  static const TextStyle onButtonDark = TextStyle(
    color: Colors.white,
    fontSize: AppFonts.bodyRegularSize,
    fontFamily: AppFonts.fontName,
    fontWeight: AppFonts.bodyRegularWeight,
  );
}
