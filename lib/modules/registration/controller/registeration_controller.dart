import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_flutter/modules/login/model/login_model.dart';
import 'package:nasa_flutter/modules/login/repository/login_repository.dart';
import 'package:nasa_flutter/modules/registration/repository/registration_repository.dart';
import 'package:nasa_flutter/utils/services/local_storage_service.dart';
import 'package:nasa_flutter/utils/ui/loader.dart';

class RegistrationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void hidePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void hideConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  register() async {
    // Get.dialog(const Loader(), barrierDismissible: false);
    isLoading.value = true;
    try {
      LoginModel user = LoginModel(
          email: emailController.text.trim(),
          password: passwordController.text);
      await RegistrationRepository().register(user);
    } catch (e) {
      Get.back();
    }
  }
}
