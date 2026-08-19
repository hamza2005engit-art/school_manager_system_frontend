import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/next_buttom.dart';
import '../../../../core/widget/page_indicator.dart';
import '../../../../routes/app_routes.dart';

class HellotecherScreen extends StatelessWidget {
  const HellotecherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Stack(
        fit:StackFit.expand ,
        children: [
          // الصورة تملأ الشاشة كاملاً
          Positioned.fill(
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? "assets/images/Gemini_Generated_Image_dli9x8dli9x8dli9.png"  // مسار صورة الداكن
                  : "assets/images/Gemini_Generated_Image_r1ebw8r1ebw8r1eb.png", // مسار صورة الفاتح
              fit: BoxFit.cover,
            ),
          ),
          // النص
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              ),
              child: const Text(
                "Welcome to SchoolManage",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // زر Next
          Positioned(
            bottom: 90,
            left: 24,
            right: 24,
            child: NextButton(
              onTap: () => Get.toNamed(Routes.HELLO3),
            ),
          ),
          // Page Indicator
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: PageIndicator(
              totalPages: 3,
              currentPage: 1,
            ),
          ),
        ],
      ),
    );
  }
}

