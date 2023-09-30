import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/view_models/AuthExceptions/auth_exception.dart';
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
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  void authSignup() async {
    loading.value = true;
    await _auth
        .createUserWithEmailAndPassword(
            email: emailController.value.text,
            password: passwordController.value.text)
        .then((value) async {
      Utils.snackBar('Success', 'Account Created Successfully');
      await _db.collection('users').doc(value.user!.uid).set({
        'email': emailController.value.text,
        'password': passwordController.value.text,
        'phoneNumber': phoneController.value.text,
        'uid': value.user!.uid,
      });
      loading.value = false;
      Get.offAllNamed(RouteName.loginScreen);
    }).catchError((error) {
      AuthException.authExceptionToast(error.code);
      loading.value = false;
    });
  }
}
