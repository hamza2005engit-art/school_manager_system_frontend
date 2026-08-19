import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/widget/custom_text_field.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../controllers/register_controller.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

import 'logIn_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: CornerCircles(),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                   AuthHeader(
                    title: "creat acount".tr,
                    subtitle: "creat acount subtitlr".tr,
                  ),
                  // سنضيف الحقول هنا خطوة خطوة
                  const SizedBox(height: 24,),
                  CustomTextField(
                      controller:controller.nameController ,
                      label: "fullname".tr,
                      hintText: "fullname_hint".tr,
                   // hintColor: const Color(0xFF364F72),
                    prefixIcon: Icons.person_outline_outlined,
                   // iconColor: const Color(0xFF364F72),
                  ),

                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller: controller.emailController, // تأكد من تعريفه في الـ Controller
                    label: "Email".tr,
                    hintText: "example@mail.com",
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller:controller.phoneController ,
                    label: "Phone Number".tr,
                    hintText: "phone_hint".tr,
                   // hintColor: const Color(0xFF364F72),
                    prefixIcon: Icons.phone,
                   // iconColor: const Color(0xFF364F72),
                  ),

                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller:controller.locationController ,
                    label: "location".tr,
                    hintText: "location_hint".tr,
                    //hintColor: const Color(0xFF364F72),
                    prefixIcon: Icons.location_on,
                    //iconColor: const Color(0xFF364F72),
                  ),
                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller:controller.subjectController ,
                    label: "subject".tr,
                    hintText: "subject_hint".tr,
                   // hintColor: const Color(0xFF364F72),
                    prefixIcon: Icons.person_outline_outlined,
                    //iconColor: const Color(0xFF364F72),
                  ),
                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller:controller.passwordController ,
                    label: "password_label".tr,
                    hintText: "Enter password".tr,
                    //hintColor: const Color(0xFF364F72),

                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                   // iconColor: const Color(0xFF364F72),
                  ),
                  const SizedBox(height: 24,),
                  CustomTextField(
                    controller:controller.confirmPasswordController ,
                    label: "confirm_password".tr,
                    hintText: "confirm_password_hint".tr,
                    //hintColor: const Color(0xFF364F72),

                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                   // iconColor: const Color(0xFF364F72),
                  ),
                  const SizedBox(height: 32),
                  // استخدام Obx لمراقبة حالة التحميل وتغيير شكل الزر
                  Obx(
                        () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                      text: "Register".tr,
                      icon: Icons.login,
                      onPressed: () {
                        // استدعاء دالة تسجيل الدخول من المتحكم
                        controller.register();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}