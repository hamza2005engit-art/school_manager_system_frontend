import 'dart:ui' as BorderType;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import 'package:student_project1/core/widget/custom_link.dart';
import '../../../../core/widget/costum_image_continer.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/custom_role_card.dart';
import '../../../../routes/app_routes.dart';

import '../controllers/register_controller.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

import 'logIn_screen.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return Scaffold(
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),

        child: Obx(

              () => controller.isLoading.value

              ? const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )

              : CustomButton(

            text: "continue".tr,

            icon: Icons.login,

            onPressed: () => Get.toNamed(Routes.REGISTER2),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CornerCircles(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  /// المحتوى القابل للتمرير
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          AuthHeader(
                            title: "creat acount".tr,
                            subtitle: "creat acount subtitlr".tr,
                          ),
                          const SizedBox(height: 24),

                          Align(
                            alignment: Get.locale?.languageCode == "ar"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text('Choose role'.tr),
                          ),

                          const SizedBox(height: 14),

                          Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoleCard(
                                title: 'Student'.tr,
                                isSelected: controller.selectedRole.value == "student",
                                onTap: () => controller.selectedRole.value = "student",
                              ),
                              RoleCard(
                                title: 'Teacher'.tr,
                                isSelected: controller.selectedRole.value == "teacher",
                                onTap: () => controller.selectedRole.value = "teacher",
                              ),
                              RoleCard(
                                title: 'Parents'.tr,
                                isSelected: controller.selectedRole.value == "admin",
                                onTap: () => controller.selectedRole.value = "admin",
                              ),
                            ],
                          )),

                          const SizedBox(height: 24),

                          Align(
                            alignment: Get.locale?.languageCode == "ar"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text('add photo'.tr),
                          ),

                          const SizedBox(height: 14),

                          Obx(() => ImagePickerCard(
                            label: "Person Image".tr,
                            image: controller.identityImage.value,
                            onTap: () => controller.pickImage(false),
                          )),
                        ],
                      ),
                    ),
                  ),

                  /// 👇 هذا هو "آخر الصفحة"
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                        'Already have account? ',
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                           CustomLink(text: "Log In",onPressed: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },)
                        ],
                      ),

                      const SizedBox(height: 10),
                    ],
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