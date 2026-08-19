import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../domain/entities/forgetpassword_user.dart';
import '../../domain/usecases/forgetpassword_usecase.dart';

class ForgetPasswordController extends GetxController {
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordController(this.resetPasswordUseCase);

  final isLoading = false.obs;
  final messageController = TextEditingController();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  Future<void> resetPassword() async {
    isLoading.value = true;

    try {
      final result = await resetPasswordUseCase(
        ForgetpasswordUser(
          message: messageController.text,
          email: emailController.text,
          otp: otpController.text,
          password: passwordController.text,
          password_confirmation: passwordConfirmationController.text,
        ),
      );

      Get.snackbar(
        'نجاح',
        'تم تغيير كلمة المرور بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAllNamed(Routes.LOGIN);

    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}