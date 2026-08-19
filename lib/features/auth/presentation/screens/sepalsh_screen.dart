import 'dart:async';
import 'package:flutter/material.dart';
// تم إزالة استيراد lottie إذا لم تعد بحاجة إليه في هذه الصفحة
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_routes.dart';
import '../../../../core/constants/app_constants.dart'; // استيراد الثوابت للوصول لـ logoPath

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
// داخل كلاس _SplashScreenState في ملف sepalsh_screen.dart@override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // الانتقال لصفحة الترحيب الأولى بعد 3 ثوانٍ
      Get.offAllNamed(Routes.HELLO1);
    });
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Timer(const Duration(seconds: 3), () { // تقليل الوقت لـ 3 ثوانٍ بما أنها صورة ثابتة
      if (mounted) {
        if (token != null && token.isNotEmpty) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.HELLO1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B3D2E), Color(0xFF041A12), Colors.black],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // استبدال Lottie بصورة اللوغو
              Image.asset(
                AppConstants.logoPath,
                width: 250, // يمكنك تعديل الحجم حسب الرغبة
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.school, size: 100, color: Colors.white);
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "SchoolManage", // تم تعديل النص ليناسب اللوغو
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}