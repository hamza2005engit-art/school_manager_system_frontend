import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_fonts.dart';

class CustomContainerSalary extends StatelessWidget {
  final String salary;

  CustomContainerSalary({required this.salary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      width: 408,

      ///height: 150,
      //width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xFF08314F), Color(0XFF006879)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Salary ber month".tr,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: AppFonts.fontName,
              fontSize: AppFonts.labelSmallSize,
              fontWeight: AppFonts.bodyRegularWeight,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${salary} \$",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: AppFonts.fontName,
                  fontSize: AppFonts.headLargeSize,
                  fontWeight: AppFonts.headLargeWeight,
                ),
              ),
              Icon(Icons.money, size: 80, color: Colors.white.withOpacity(0.2)),
            ],
          ),
        ],
      ),
    );
  }
}
