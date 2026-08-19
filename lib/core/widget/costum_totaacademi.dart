import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class totalacademi extends StatelessWidget{
  
  final double total_acdemi;
  final String class_rank;
  final String degre;

  const totalacademi({
    super.key,
    required this.total_acdemi,
    required this.class_rank,
    required this.degre,





  });
  @override
  Widget build(BuildContext context){
    return Container(
      width: 200,
      height: 400,
      child: Card(

color: Theme.of(context).brightness == Brightness.dark
    ? AppColors.backcardDark
    : AppColors.bodyFontDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Academic Standing".tr,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدائرة
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 55,
                        sections: [
                          // الجزء الممتلئ
                          PieChartSectionData(
                            value: total_acdemi ?? 0,
                            color: Theme.of(context).primaryColor,
                            radius: 15,
                            showTitle: false,
                          ),
                          // الجزء الفارغ
                          PieChartSectionData(
                            value: (100 - total_acdemi ?? 0),
                            color: Colors.grey.shade200,
                            radius: 15,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                    // الرقم في المنتصف
                    Text(
                      "${total_acdemi}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(

                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.backgroundDark
                      : AppColors.contonergredLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Text("Degree",
                      style: TextStyle(
                        fontSize: 16,
                        color:  Theme.of(context).brightness == Brightness.dark
                            ? AppColors.textFeildLight
                            : AppColors.degreLight,
                      ),

                      ),
                      Spacer(),

                      Text(
                        degre,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:  Theme.of(context).brightness == Brightness.dark
                              ? AppColors.ALight
                              : AppColors.ALight,
                          fontSize: 27
                        ),

                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(

                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.backgroundDark
                      : AppColors.contonergredLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Text("Class",
                        style: TextStyle(
                          fontSize: 16,
                          color:  Theme.of(context).brightness == Brightness.dark
                              ? AppColors.textFeildLight
                              : AppColors.degreLight,
                        ),

                      ),




                      Spacer(),

                      Text(
                        class_rank,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:  Theme.of(context).brightness == Brightness.dark
                                ? AppColors.ALight
                                : AppColors.ALight,
                            fontSize: 27
                        ),

                      ),

                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}