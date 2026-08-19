import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../features/exercise/presentaion/screens/all_exercise.dart';
import 'custom_build_card.dart';

class CustomContainer4Card extends StatelessWidget {
  final double localWidth;
  final String role;
  const CustomContainer4Card({super.key, required this.localWidth, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomBuildCard(
                  icon: Icons.local_library,
                  title: "Library".tr,
                  onTap: () {
                    Get.toNamed(Routes.LIBRARY);
                  }, localWidth: localWidth,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomBuildCard(
                  icon: role == 'student' ? Icons.payments_outlined : Icons.message,
                  title: role == 'student' ?"Fees".tr : "Messages".tr,
                  onTap: () {
                    if(role == 'student') {
                      Get.toNamed(Routes.FEES);
                    }
                  }, localWidth: localWidth,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomBuildCard(
                  icon: Icons.groups,
                  title: "Exercises".tr,
                  onTap: () {
                    Get.toNamed(Routes.AllExercise);
                  }, localWidth: localWidth,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomBuildCard(
                  icon: Icons.settings,
                  title: "About Us".tr,
                  onTap: () {
                    Get.toNamed(Routes.About);
                  }, localWidth: localWidth,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
