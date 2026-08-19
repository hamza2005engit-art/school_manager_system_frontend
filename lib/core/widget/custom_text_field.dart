import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/constants/app_numbers.dart';
import 'package:student_project1/features/auth/presentation/controllers/password_visibility_controller.dart';

class CustomTextField extends StatelessWidget {
  final int?maxLines;
  final String label;           // النص الذي يظهر فوق الحقل (مثل: البريد الإلكتروني)
  final String hintText;        // النص التوضيحي داخل الحقل (مثل: example@mail.com)
  final IconData? prefixIcon;   // الأيقونة التي تظهر في بداية الحقل (مثل أيقونة القفل)
  final bool isPassword;        // هل هذا الحقل مخصص لكلمة سر؟ (لتفعيل ميزة الإخفاء)
  final TextEditingController? controller; // للتحكم في النص المدخل واستخراجه
  final String? validationTag;
  final Color? labelColor;   // الأيقونة التي تظهر في بداية الحقل (مثل أيقونة القفل)
  final Color? hintColor;// "البصمة" الفريدة لهذا الحقل في ذاكرة Get
  final Color? iconColor;

  const CustomTextField({
    super.key,
    this.maxLines,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.validationTag,
    this.labelColor,
    this.hintColor,
this.iconColor

  });

  @override
  Widget build(BuildContext context) {
    // ربط الكنترولر باستخدام التاج إذا كان الحقل كلمة سر
    final passwordController = isPassword
        ? Get.put(PasswordVisibilityController(), tag: validationTag)
      //Get.find<PasswordVisibilityController>(tag: validationTag)
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: labelColor,

        )),

        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppNumbers.textFeildRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: isPassword
              ? Obx(() => buildTextField(passwordController!.isObscured.value, passwordController,context))
              : buildTextField(false, null,context),
        ),
      ],
    );
  }

  // دالة بناء الحقل لتقليل تكرار الكود
  Widget buildTextField(bool obscure, PasswordVisibilityController? pController,context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      maxLines: isPassword?1:maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: hintColor,
        ),
        prefixIcon: Icon(prefixIcon, size: 20,color: iconColor,),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: () => pController!.toggleVisibility(),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppNumbers.textFeildRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppNumbers.textFeildRadius),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppNumbers.textFeildRadius),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
