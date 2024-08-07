import 'package:big_cart_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/Routes/route_name.dart';
import '../../services/Authentication/AuthenticationService.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isRememberMe = true.obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  Authentication auth = Authentication();

  void authLogin() async {
    bool response;
    loading.value = true;
    response = await auth.Login(emailController.value.text.trim(),
        passwordController.value.text.trim());
    if (response) {
      Utils.snackBar('success'.tr, 'login_success'.tr);
      Get.offAllNamed(RouteName.dashboardScreen);
    } else {
      loading.value = false;
    }
  }

  void navigateToSignUpScreen() {
    Get.toNamed(RouteName.signupScreen);
  }
}
