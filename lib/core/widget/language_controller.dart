import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isArabic';

  // تحديد اللغة الحالية بناءً على المحفوظ في GetStorage
  RxBool isArabic = false.obs;

  @override
  void onInit() {
    super.onInit();
    // استرجاع القيمة المحفوظة أو الاعتماد على اللغة الافتراضية
    isArabic.value = _storage.read(_key) ?? (Get.locale?.languageCode == 'ar');
  }

  // دالة تغيير اللغة
  void changeLanguage(String languageCode, String countryCode) {
    Locale locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);

    // حفظ التفضيل
    isArabic.value = (languageCode == 'ar');
    _storage.write(_key, isArabic.value);
  }
}