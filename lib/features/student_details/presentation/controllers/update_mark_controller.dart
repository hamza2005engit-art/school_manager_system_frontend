import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/student_details/domain/entity/update_mark_entity.dart';
import '../../domain/usecases/update_mark_usecase.dart';

class UpdateMarkController extends GetxController {
  final CreateMarkUseCase updateMarkUseCase;
  UpdateMarkController({required this.updateMarkUseCase});

  final scoreController = TextEditingController();
  var isLoading = false.obs;
  var selectedType = 'test'.obs;

  Future<void> updateMark({
    required String studentId,
    required String materialId,
  }) async {
    if (scoreController.text.trim().isEmpty) {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال درجة الطالب أولاً",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    final int? score = int.tryParse(scoreController.text.trim());
    if (score == null || score < 0 || score > 100) {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال درجة صحيحة بين 0 و 100",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      final markEntity = CreateMarkEntity(
        studentId: studentId,
        materialId: materialId,
        type: selectedType.value,
        score: score,
      );
      final isSuccess = await updateMarkUseCase.call(markEntity);

      if (isSuccess) {
        Get.snackbar(
          "نجاح العملية",
          "تم تحديث درجة الطالب بنجاح",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        scoreController.clear();
      } else {
        Get.snackbar(
          "فشل التحديث",
          "لم يتم العثور على العلامة لتعديلها أو حدث خطأ في النظام",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "خطأ في الاتصال",
        e.toString().replaceAll('Exception:', '').trim(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void changeSelectedType(String type) {
    selectedType.value = type;
  }

  @override
  void onClose() {
    scoreController.dispose();
    super.onClose();
  }
}