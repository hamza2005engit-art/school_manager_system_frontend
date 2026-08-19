import 'package:flutter/material.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CustomLink extends StatelessWidget {
  final String text;
  const CustomLink({super.key, required this.text, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero, // لتقليل المسافات الزائدة
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: AppFonts.bodyLargeSize,
          fontWeight: AppFonts.bodyLargeWeight,
        ),
      ),
    );
  }
}
