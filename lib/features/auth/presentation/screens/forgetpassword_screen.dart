import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgetpassword_controller.dart';
import '../controllers/login_controller.dart';
import 'package:student_project1/core/widget/custom_link.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/core/widget/custom_buttom.dart';
import 'package:student_project1/core/widget/custom_text_field.dart';
import 'package:student_project1/features/auth/presentation/widgets/login_footer.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف المتحكم يدوياً إذا لم يتعرف عليه GetView تلقائياً
    final ForgetPasswordController controller = Get.find<ForgetPasswordController>();
    // تعريف Controllers لحقول الإدخال للحصول على النصوص منها



    return Scaffold(
      // هذا السطر يمنع العناصر من القفز للأعلى عند ظهور لوحة المفاتيح
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CornerCircles(),
          SafeArea(
            minimum: const EdgeInsets.all(12),
            child: Center(
              // Center لضمان توسيط العناصر في الشاشات الكبيرة
              child: SingleChildScrollView(
                // إضافة BouncingScrollPhysics تعطي شعوراً أفضل عند التمرير
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     AuthHeader(
                      title: "forget_password_title".tr,
                      subtitle: "forget_password_subtitle".tr,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller:controller.emailController,
                      label: "email".tr,
                      hintText: "email_hint".tr,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: controller.otpController,
                      label: " ip".tr,
                      hintText: "ip_hint".tr,
                      prefixIcon: Icons.code_sharp,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: controller.passwordController,
                      label: "new_password".tr,
                      hintText: "new_password_hint".tr,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validationTag: "logIn",
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: controller.passwordConfirmationController,
                      label: "new_password".tr,
                      hintText: "new_password_hint".tr,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validationTag: "logIn",
                    ),
                    const SizedBox(height: 16),
                     Align(
                      alignment: Alignment.centerRight,
                      child: CustomLink(text: "forget_password_link".tr,onPressed: (){},),
                    ),
                    const SizedBox(height: 32),
                    // استخدام Obx لمراقبة حالة التحميل وتغيير شكل الزر
                    Obx(
                          () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                        text: "continue".tr,
                        icon: Icons.login,
                        onPressed: () {
                          // استدعاء دالة تسجيل الدخول من المتحكم
                          controller.resetPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    const LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
