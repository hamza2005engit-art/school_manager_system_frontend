import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../domain/entities/addnotifincation_user.dart';
import '../../domain/usecases/addnotifincation_usecase.dart';

class AddNotfincationController extends GetxController {
  final AddNotifincationUsecase addnotifincationusercase;

  AddNotfincationController(this.addnotifincationusercase);

  final isLoading = false.obs;

  final titleController = TextEditingController();
  final conectController = TextEditingController();
  final gradeController = TextEditingController();

  final grades = <String>[].obs;
  final students = <String>[].obs;

  final selectedGrade = Rxn<String>();
  final selectedStudent = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    grades.value = ['الصف 1', 'الصف 2', 'الصف 3']; // مؤقت
  }

  Future<void> addnotifincation() async {
    if (titleController.text.trim().isEmpty ||
        conectController.text.trim().isEmpty) {
      Get.snackbar('تنبيه', 'يرجى تعبئة كل الحقول');
      return;
    }

    isLoading.value = true;
    try {
      await addnotifincationusercase.call(
        AddNotifincationUser(
          title: titleController.text.trim(),
          content: conectController.text.trim(),
          grade: selectedGrade.value ?? '',
        ),
      );

      Get.snackbar('نجاح', 'تم إرسال الإشعار بنجاح');
      titleController.clear();
      conectController.clear();
      selectedGrade.value = null;
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loadStudents(String grade) {
    // مؤقتاً بيانات وهمية
    students.value = ['طالب 1', 'طالب 2', 'طالب 3'];
    // عند الربط مع API ستجلبهم من السيرفر
  }
}