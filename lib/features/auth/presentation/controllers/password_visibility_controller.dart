import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  // متغير مرصود للحالة
  var isObscured = true.obs;

  void toggleVisibility() {
    isObscured.value = !isObscured.value;
  }
}