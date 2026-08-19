import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
class MyPieChart extends StatelessWidget {
  final double gpa;

  const MyPieChart({super.key, required this.gpa});

  @override
  Widget build(BuildContext context) {
    final double safeGpa = gpa.clamp(0.0, 100.0);
    final double remaining = 100.0 - safeGpa;

    return SizedBox(
      height: 180,
      width: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              centerSpaceRadius: 50,
              sectionsSpace: 2,
              sections: [
                PieChartSectionData(
                  value: safeGpa,
                  color: AppColors.secondryLight,
                  radius: 40,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: remaining,
                  color: Colors.grey.shade300,
                  radius: 40,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${safeGpa.toStringAsFixed(1)}%",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryLight,
                ),
              ),
              Text(
                "Current GPA".tr,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}