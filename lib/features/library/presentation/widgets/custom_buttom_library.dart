import 'package:flutter/material.dart';
import 'package:student_project1/core/theme/app_theme.dart';

class CustomBottomLibrary extends StatelessWidget {
  const CustomBottomLibrary({super.key, required this.text, required this.color, required this.localWidth, this.onTap});
  final String text;
  final Color color;
  final double localWidth;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: localWidth * .42,
        padding: EdgeInsets.symmetric(horizontal: 48.5,vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: -4,
                blurRadius: 6,
                color: Color(0xFF0000001A)
            )
          ],
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

}