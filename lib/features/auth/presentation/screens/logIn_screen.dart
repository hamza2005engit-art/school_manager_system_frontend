import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../controllers/login_controller.dart';
import 'package:student_project1/core/widget/custom_link.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/core/widget/custom_buttom.dart';
import 'package:student_project1/core/widget/custom_text_field.dart';
import 'package:student_project1/features/auth/presentation/widgets/login_footer.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء المتحكم (يجب أن يحتوي LoginController على emailController و passwordController)
    final LoginController controller = Get.find<LoginController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CornerCircles(),
          SafeArea(
            minimum: const EdgeInsets.all(12),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthHeader(
                      title: "Login".tr,
                      subtitle: "login_subtitle".tr,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      // ربط الحقل مباشرة بالمتحكم لضمان قراءة البيانات بشكل صحيح
                      controller: controller.emailController,
                      label: "email".tr,
                      hintText: "email@example.com".tr,
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      // ربط الحقل مباشرة بالمتحكم
                      controller: controller.passwordController,
                      label: "Password".tr,
                      hintText: "Enter password".tr,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validationTag: "logIn",
                    ),
                    const SizedBox(height: 16),
                    // ابحث عن الجزء الخاص بـ CustomLink وقم بتعديله
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // استبدل Routes.FORGET_PASSWORD بالمسار الصحيح لديك
                          Get.toNamed('/forget-password');
                        },
                        child: CustomLink(text: "forget_password?".tr,onPressed: (){
                          Get.toNamed(Routes.FirstFORGETPASSWORD);
                        }),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Obx(
                          () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                        text: "Login".tr,
                        icon: Icons.login,
                        onPressed: () {
                          // استدعاء الدالة بدون تمرير قيم، لأن القيم تُسحب الآن من داخل المتحكم
                          controller.login();
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
