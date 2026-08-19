import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CustomBuildCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double localWidth;
  final VoidCallback? onTap; // 👈 إضافة التابع

  const CustomBuildCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.localWidth,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: localWidth,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppFonts.bodyRegularSize,
                  fontFamily: AppFonts.fontName,
                  fontWeight: AppFonts.bodyLargeWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}