import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/widget/language_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ربط متحكم اللغة
    final LanguageController controller = Get.put(LanguageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('change_language'.tr), // يمكنك إضافة هذا المفتاح في ملفات الترجمة
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.language,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              'choose_language'.tr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // خيار اللغة العربية
            Obx(() => _buildLanguageCard(
              context: context,
              title: 'العربية',
              subtitle: 'Arabic',
              flag: '🇸🇦',
              isSelected: controller.isArabic.value,
              onTap: () {
                // استنساخاً لمفتاحك المفترض ar_SA
                controller.changeLanguage('ar', 'SA');
              },
            )),

            const SizedBox(height: 15),

            // خيار اللغة الإنجليزية
            Obx(() => _buildLanguageCard(
              context: context,
              title: 'English',
              subtitle: 'الإنجليزية',
              flag: '🇺🇸',
              isSelected: !controller.isArabic.value,
              onTap: () {
                controller.changeLanguage('en', 'US');
              },
            )),
          ],
        ),
      ),
    );
  }

  // بطاقة اختيار اللغة Custom Widget
  Widget _buildLanguageCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Text(
          flag,
          style: const TextStyle(fontSize: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: isSelected
            ? Icon(
          Icons.check_circle,
          color: Theme.of(context).primaryColor,
          size: 28,
        )
            : const Icon(
          Icons.circle_outlined,
          color: Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}