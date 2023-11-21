import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/services/Authentication/auth_exception.dart';
import 'package:big_cart_app/services/Authentication/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpController extends GetxController {
  final RxBool isPasswordNotVisible = true.obs;
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordConfirmController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordConfirmFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final Authentication _auth = Authentication();
  void authSignup() async {
    loading.value = true;
    bool response = await _auth.SignUp(
        emailController.value.text.trim(),
        passwordController.value.text.trim(),
        phoneController.value.text.trim());
    if (response) {
      Utils.snackBar('Success', 'Account Created Successfully');
      loading.value = false;
      Get.offAllNamed(RouteName.loginScreen);
    } else {
      loading.value = false;
      Utils.snackBar('Error', 'Something went wrong');
    }
  }

  void navigateToLoginScreen() {
    Get.toNamed(RouteName.loginScreen);
  }
}
