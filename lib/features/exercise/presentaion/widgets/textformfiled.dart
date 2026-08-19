import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';


class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  const CustomTextFormFiled({super.key, required this.controller, required this.hintText,this.maxLines = 1,});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        // labelText: "Notification Title",
        hintText: "${hintText}",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.hintFontLIght
        ),
        contentPadding: EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: AppColors.primaryLight,
              width: 2),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFFFFFFF))
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

}
