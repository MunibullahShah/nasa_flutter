import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_flutter/config/theme/app_colors.dart';
import 'package:nasa_flutter/constants/app_constants.dart';
import 'package:nasa_flutter/main.dart';
import 'package:nasa_flutter/modules/login/controller/login_controller.dart';
import 'package:nasa_flutter/modules/login/widgets/password_visibility.dart';
import 'package:nasa_flutter/modules/registration/view/registration_view.dart';
import 'package:nasa_flutter/utils/ui/buttons/primary_button.dart';
import 'package:nasa_flutter/utils/ui/custom_text.dart';
import 'package:nasa_flutter/utils/ui/textfields/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginController _controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    fontRatio = MediaQuery.of(context).size.width / 470;

    setStatusBarIconsColor(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.02 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.21 * height,
              ),
              CustomText(
                text: 'Log In',
                fontSize: 35,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: 'Enter your details below.',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(
                height: 0.1 * height,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Your Email',
                  fontSize: 14,
                  color: AppColors().grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomTextField(
                controller: _controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validationFunction: (value) {
                  if (value == "" || value.isNull) {
                    return "Please type correct email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors().grey,
                ),
              ),
              Obx(() => CustomTextField(
                    controller: _controller.passwordController,
                    obscureText: _controller.obscurePassword.value,
                    suffixIcon: PasswordVisibility(
                      obscurePassword: _controller.obscurePassword.value,
                      onTap: _controller.hidePassword,
                    ),
                  )),
              SizedBox(
                height: 0.04 * height,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => RegistrationView(),
                    );
                  },
                  child: CustomText(
                    text: 'Registration',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors().secondary,
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Log In',
                onTap: () {
                  _controller.login();
                },
              ),
              SizedBox(
                height: 0.04 * height,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
