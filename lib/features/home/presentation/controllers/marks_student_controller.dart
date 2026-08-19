




import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:student_project1/features/home/domain/usecases/marks_student_usecase.dart';

class MarksStudentController extends GetxController {
  final MarksStudentUsecase marksStudentUsecase;

  MarksStudentController(this.marksStudentUsecase);

  final isLoading = false.obs;

  final exersicesController = TextEditingController();
  final testController = TextEditingController();
  final finaleController = TextEditingController();

  final totalController = TextEditingController();
  final total_academiController = TextEditingController();
  final subjectController = TextEditingController();
  final degreeController = TextEditingController();
  final class_rankController = TextEditingController();






  Future<void> marksstudent() async {
    isLoading.value = true;
    try {
      await marksStudentUsecase;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}