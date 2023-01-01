import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_flutter/modules/login/model/login_model.dart';
import 'package:nasa_flutter/modules/login/repository/login_repository.dart';
import 'package:nasa_flutter/utils/services/local_storage_service.dart';
import 'package:nasa_flutter/utils/ui/loader.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void hidePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  login() async {
    Get.dialog(const Loader(), barrierDismissible: false);
    isLoading.value = true;
    try {
      LoginModel user = LoginModel(
          email: emailController.text.trim(),
          password: passwordController.text);
      user = await LoginRepository().login(user);
      // Get.offAll(() => CampaignsView());
    } catch (e) {
      Get.back();
    }
  }
}
