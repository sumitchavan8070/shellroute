
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/go_path.dart';

class ValidationController extends GetxController {

  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  RxString? passwordError = ''.obs;
  RxString? cPasswordError = ''.obs;

  void validatePassword() {
    final password = passwordController.text;
    final confirmPassword = cPasswordController.text;
      passwordError!.value = '';
      cPasswordError!.value = '';
    if (password.isEmpty) {
        passwordError!.value = "Enter password";
      return;
    }

    if (confirmPassword.isEmpty) {
        cPasswordError!.value = "Enter Confirm password";
    }

    if (password != confirmPassword) {
        cPasswordError!.value = "Passwords do not match";
    }
    Get.toNamed(GoPath.successPassword);
  }
}

