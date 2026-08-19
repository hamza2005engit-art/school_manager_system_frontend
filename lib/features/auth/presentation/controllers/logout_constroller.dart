import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/routes/app_routes.dart';

class LogoutController extends GetxController {
  final box = GetStorage();

  void logout() {
    box.remove('token');
    box.remove('name');
    box.remove('role');
    Get.snackbar(
      'Logout',
      'تم تسجيل الخروج بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}