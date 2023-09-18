import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/view_models/AuthExceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/Routes/route_name.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isRememberMe = false.obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void AuthLogin() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    loading = true.obs;
    auth
        .signInWithEmailAndPassword(
          email: emailController.value.text.trim(),
          password: passwordController.value.text.trim(),
        )
        .then((value) => {
              loading = false.obs,
              Utils.snackBar('success'.tr, 'login_success'.tr),
              Get.offAllNamed(RouteName.homeScreen),
            })
        .catchError((error) {
      AuthException.authExceptionToast(error.code);
      loading = false.obs;
      return error;
    });
  }
}
