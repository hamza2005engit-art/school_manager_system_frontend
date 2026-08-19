import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/services/fcm_service.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final Rxn<User> user = Rxn<User>();
  final storage = GetStorage();

  LoginController({required this.loginUseCase});

  // 1. تعريف المتحكمات هنا لضمان سهولة الوصول إليها والتحكم في الرسائل
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  // 2. تعديل الدالة لعدم استقبال بارامترات (ستسحبها من المتحكمات مباشرة)
  Future<void> login() async {
    // التحقق من الحقول قبل البدء
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال البريد الإلكتروني وكلمة المرور",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      // 3. استدعاء الـ UseCase
      final result = await loginUseCase.call(
        emailController.text.trim(),
        passwordController.text,
      );

      user.value = result;

      storage.write('token', result.token);
      storage.write('role', result.role);
      storage.write('name', result.name);
      storage.write('material_id', result.materialId ?? '');

      // 3. حفظ بقية المصفوفات والقوائم بعد تحويلها لنصوص JSON آمنة
      storage.write('material', jsonEncode(result.material ?? []));
      storage.write('salary', result.salary ?? 0);
      storage.write('section', jsonEncode(result.section ?? []));
      storage.write('grade', jsonEncode(result.stage_number ?? []));
      print('grade ${result.stage_number}');

      // إرسال FCM token للباك بعد تسجيل الدخول مباشرة
      // (جوا try/catch منفصل حتى لو فشل ما يوقف عملية تسجيل الدخول)
      try {
        await Get.find<FcmService>().init();
      } catch (e) {
        print('FCM init failed: $e');
      }

      //storage.write('image', result.im)
      // 4. رسالة النجاح (تظهر فقط إذا اكتمل السطر السابق بدون أخطاء)
      Future.delayed(Duration(seconds: 1),() {
        Get.snackbar(
          "نجاح",
          "تم تسجيل الدخول بنجاح",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      });

      // 5. الانتقال للصفحة التالية بعد نجاح العملية
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.Home1);
      });

    } catch (e) {
      // 6. معالجة الخطأ الحقيقي فقط
      String errorMessage = e.toString().replaceAll('Exception:', '').trim();

      Get.snackbar(
        "خطأ في الدخول",
        errorMessage.contains("401")
            ? "البريد الإلكتروني أو كلمة المرور غير صحيحة"
            : "حدث خطأ أثناء الاتصال بالخادم",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      // ignore: avoid_print
      print("The actual error is: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // تنظيف الذاكرة
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}