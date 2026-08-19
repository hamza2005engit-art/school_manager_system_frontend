import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/theme/app_theme.dart';
import 'package:student_project1/routes/app_pages.dart';

import 'core/database/isar_service.dart';
import 'core/services/fcm_service.dart';
import 'core/translation/app_translations.dart';
import 'features/auth/presentation/screens/logIn_screen.dart';
import 'features/auth/presentation/screens/hellomogeh_screen.dart';
import 'features/home_page/presentation/controllers/average_controller.dart';
import 'features/schedule/data/datasources/schedule_local_data_source.dart';
import 'features/student_managment_admin/presentation/bindings/student_managment_admin_binding.dart';
import 'firebase_options.dart';

// لازم يكون top-level function (برا أي class)، واللي بيتعالج فيها
// الإشعارات وقت يكون التطبيق مقفول أو بالخلفية
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(FcmService(), permanent: true);   // ← أضف هذا

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // قراءة اللغة المحفوظة (إن وجدت)
    final storage = GetStorage();
    final bool? isArabic = storage.read('isArabic');

    // تحديد الـ Locale المبدئي
    Locale initialLocale = const Locale('en', 'US');
    if (isArabic != null) {
      initialLocale = isArabic ? const Locale('ar', 'SA') : const Locale('en', 'US');
    }

    return GetMaterialApp(
      title: "School Management System",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),

      // استخدام اللغة المحفوظة بدلاً من المباشرة
      locale: initialLocale,
      fallbackLocale: const Locale('en', 'US'),

      builder: (context, child) {
        return Directionality(
          // التفاعل التلقائي مع اتجاه النص بناءً على الـ Locale الحالي
          textDirection: Get.locale?.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}