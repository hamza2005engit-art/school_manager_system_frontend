import 'package:flutter/material.dart';
import 'package:get/get.dart'; // تأكد من استيراد Get بالكامل
import 'package:image_picker/image_picker.dart';

import '../../../../routes/app_routes.dart';
import '../../domain/entities/register_user.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;
  RegisterController(this.registerUseCase);

  final isLoading = false.obs;
  final selectedRole = ''.obs;
  final personImage = Rxn<XFile>();
  final identityImage = Rxn<XFile>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final subjectController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(bool isPerson) async {
    // ... (كود الـ pickImage يبقى كما هو)
    await Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("Camera"),
              onTap: () async {
                Get.back();
                final image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  isPerson
                      ? personImage.value = image
                      : identityImage.value = image;
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text("Gallery"),
              onTap: () async {
                Get.back();
                final image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  isPerson
                      ? personImage.value = image
                      : identityImage.value = image;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // التعديل هنا في دالة الـ register
  Future<void> register() async {
    // 1. التحقق من تطابق كلمة المرور قبل الإرسال
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "خطأ",
        "كلمات المرور غير متطابقة",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      // 2. تنفيذ عملية التسجيل
      await registerUseCase(RegisterUser(
        fullName: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        location: locationController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        role: selectedRole.value,
        profileImagePath: personImage.value?.path ?? '',
      ));

      // 3. إذا وصلنا هنا، يعني العملية نجحت (لأنها لم ترمِ Exception)
      Future.delayed(const Duration(seconds: 2), () {
        Get.snackbar(
          "نجاح",
          "تم إنشاء الحساب بنجاح، يمكنك تسجيل الدخول الآن",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      });


      // تأخير بسيط ليرى المستخدم رسالة النجاح ثم الانتقال
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.LOGIN);
      });

    } catch (e) {
      // 4. معالجة الخطأ الحقيقي فقط
      print("Register Error: $e");

      // تحسين شكل رسالة الخطأ (إذا كانت الرسالة تحتوي على كلمة Exception قم بتنظيفها)
      String errorMessage = e.toString().replaceAll('Exception:', '');

      Get.snackbar(
        "فشل إنشاء الحساب",
        errorMessage.isEmpty ? "تأكد من البيانات المدخلة أو اتصال الإنترنت" : errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}