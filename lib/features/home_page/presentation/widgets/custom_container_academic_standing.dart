import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';


class CustomContainerAcademic extends StatelessWidget  {
  const CustomContainerAcademic({super.key, required this.text, required this.title});
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${title}",style: TextStyle(
            fontWeight: AppFonts.bodyLargeWeight,
            fontSize: AppFonts.bodyRegularSize,
            color: AppColors.bodyFontLight
          ),),
          //درجة
          Text("${text}",style: TextStyle(
            fontSize: AppFonts.bodyLargeSize,
            fontWeight: AppFonts.bodyLargeWeight,
            color: AppColors.secondryLight,
          ),)
        ],
      ),
    );
  }

}