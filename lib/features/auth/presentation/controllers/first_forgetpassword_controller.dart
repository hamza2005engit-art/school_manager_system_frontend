

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';


import '../../../../routes/app_routes.dart';
import '../../domain/usecases/first_forgetpassword_usecase.dart';
import '../../domain/usecases/forgetpassword_usecase.dart';

class FirstForgetPasswordController extends GetxController {
  final ForgotPasswordUseCase firstforgetpasswordusercase;

  FirstForgetPasswordController(this.firstforgetpasswordusercase);

  final isLoading = false.obs;

  final emailController = TextEditingController();




  Future<void> firstforgetpassword() async {
    isLoading.value = true;

    try {
      final result = await firstforgetpasswordusercase(
        emailController.text,
      );

      Get.snackbar(
        'نجاح',
        result.message,
      );
      Get.offAllNamed(Routes.FORGETPASSWORD);

    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}

