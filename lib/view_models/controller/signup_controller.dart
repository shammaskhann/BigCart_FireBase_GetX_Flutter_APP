import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/view_models/AuthExceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final RxBool isPasswordNotVisible = true.obs;
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordConfirmController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordConfirmFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final _auth = FirebaseAuth.instance;

  void authSignup() async {
    loading.value = true;
    await _auth
        .createUserWithEmailAndPassword(
            email: emailController.value.text,
            password: passwordController.value.text)
        .then((value) {
      // This is the success callback
      Utils.snackBar('Success', 'Account Created Successfully');
      loading.value = false;
      Get.back();
    }).catchError((error) {
      AuthException.authExceptionToast(error.code);
      loading.value = false;
    });
  }
}
