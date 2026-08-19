import 'package:flutter/material.dart';
import 'package:student_project1/core/constants/app_constants.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. الشعار (Logo) داخل دائرة بحدود ملونة
        Center(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 3.0,
              ),
            ),
            child: ClipOval( // لضمان بقاء الصورة داخل الدائرة حتى لو كانت أطرافها حادة
              child: Image.asset(
                AppConstants.logoPath,
                fit: BoxFit.contain,
                // إضافة placeholder في حال تأخر تحميل الصورة (اختياري)
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.school, size: 50),
              ),
            ),
          ),
        ),
        // 2. كلمة Login
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        // 3. النص الوصفي الصغير
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32), // مساحة قبل البدء في حقول الإدخال
      ],
    );
  }
}
