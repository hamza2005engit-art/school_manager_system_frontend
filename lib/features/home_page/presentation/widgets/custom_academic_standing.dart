import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/home_page/presentation/widgets/pie_chart.dart';
import '../../../../core/theme/app_colors.dart';
import 'custom_container_academic_standing.dart';

class CustomAcademicStanding extends StatelessWidget {
  final double average;
  const CustomAcademicStanding({super.key, required this.average});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.backcardDark
              : AppColors.bodyFontDark,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "Academic Standing".tr,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
        ),
              SizedBox(height: 24,),
              Center(child: MyPieChart(gpa: average,)),
              SizedBox(height: 24,),
              CustomContainerAcademic(text: 'A', title: 'Degree'.tr,),
              SizedBox(height: 16,),
              CustomContainerAcademic(text: '#8', title: 'Class Rank'.tr,)
        ]
    )
    );
  }
  }
