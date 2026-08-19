import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/schedule/presentation/screens/schedule.dart';
import '../../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_text_style.dart';
import 'custom_button_small.dart';

class CustomContainerWorkScheduleStudent extends StatelessWidget {
  const CustomContainerWorkScheduleStudent({
    super.key,
    required this.nameTeacher,
    required this.section,
    required this.durationOfTheSession,
  });

  final String nameTeacher;
  final String section;
  final String durationOfTheSession;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// UP NEXT
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.upNextContainerLight,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text("Up Next".tr, style: AppTextStyle.upNext),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${'Class in'.tr}\n${'History'.tr}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  fontFamily: AppFonts.fontName,
                ),
              ),
              Icon(
                Icons.school_outlined,
                size: 100,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 20,
                color: AppColors.upNextContainerLight,
              ),
              SizedBox(width: 5),
              Text(
                durationOfTheSession,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.fontName,
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: AppColors.upNextContainerLight,
              ),
              SizedBox(width: 5),
              Text(
                "in your class".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.fontName,
                ),
              ),
            ],
          ),

          /// LINE
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            height: 1,
            color: AppColors.upNextContainerLight,
          ),

          /// BOTTOM ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${nameTeacher}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              InkWell(

                onTap: (){
                  Get.toNamed(Routes.SCHEDULE);
                },
                  child: CustomButtonSmall(text: "See All".tr, colorText: Color(0XFF1A237E))),
            ],
          ),
        ],
      ),
    );
  }
}
