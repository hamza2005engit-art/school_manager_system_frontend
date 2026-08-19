

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class ExercisesController extends GetxController {
  final ExercisesController exercisesusercase;

  ExercisesController(this.exercisesusercase);

  final isLoading = false.obs;

  final titleController = TextEditingController();
  final conectController = TextEditingController();
  final dateController = TextEditingController();

  final gradeController = TextEditingController();


  Future<void> exercises() async {
    isLoading.value = true;
    try {
      await exercisesusercase;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}