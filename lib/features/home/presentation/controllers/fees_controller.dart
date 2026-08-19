

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class FeesController extends GetxController {
  final FeesController feesuser;

  FeesController(this.feesuser);

  final isLoading = false.obs;

  final toata_feesController = TextEditingController();
  final totalController = TextEditingController();
  final paidController = TextEditingController();
  final toata_remainingController = TextEditingController();


  Future<void> fess() async {
    isLoading.value = true;
    try {
      await feesuser;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}