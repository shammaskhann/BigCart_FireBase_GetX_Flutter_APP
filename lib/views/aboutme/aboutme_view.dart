import 'dart:developer';

import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/views/dashboard/dashboard_controller.dart';
import 'package:big_cart_app/views/shipping/widgets/customTextfield.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AboutMe_View extends StatelessWidget {
  const AboutMe_View({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());
    Future<void> getUserInfo() async {
      FirebaseServices firebaseServices = FirebaseServices();
      var info = await firebaseServices
          .getUserInfo(FirebaseAuth.instance.currentUser!.uid);
      await changePasswordController.importInfoInTextField(info);
      //log(info.toString());
    }

    getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me', style: AppTextStyles.appBarStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 0.9,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Personal Information',
                        style: AppTextStyles.heading),
                  ),
                  CustomTextFeild(
                    controller: changePasswordController.nameController,
                    currentNode: changePasswordController.nameFocusNode,
                    nextNode: changePasswordController.emailFocusNode,
                    hint: 'Name',
                    leadingIcon: AppTextFeildIcons.profileIcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          changePasswordController.nameFocusNode,
                          changePasswordController.emailFocusNode);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFeild(
                    controller: changePasswordController.emailController,
                    currentNode: changePasswordController.emailFocusNode,
                    nextNode: changePasswordController.numberFocusNode,
                    hint: 'Email',
                    leadingIcon: AppTextFeildIcons.emailIcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          changePasswordController.emailFocusNode,
                          changePasswordController.numberFocusNode);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFeild(
                    controller: changePasswordController.numberController,
                    currentNode: changePasswordController.numberFocusNode,
                    nextNode: changePasswordController.confirmPasswordFocusNode,
                    hint: 'Phone Number',
                    leadingIcon: AppTextFeildIcons.phoneIcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          changePasswordController.numberFocusNode,
                          changePasswordController.confirmPasswordFocusNode);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Confirm Password', style: AppTextStyles.heading),
                  const SizedBox(
                    height: 10,
                  ),
                  // Current Password
                  // CustomTextFeild(
                  //   controller:
                  //       changePasswordController.currentPasswordController,
                  //   currentNode:
                  //       changePasswordController.currentPasswordFocusNode,
                  //   nextNode: changePasswordController.confirmPasswordFocusNode,
                  //   hint: 'Current Password',
                  //   leadingIcon: AppTextFeildIcons.lockIcon,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter your current password';
                  //     }
                  //     return null;
                  //   },
                  //   onFieldSubmitted: (value) {
                  //     Utils.fieldFocusChange(
                  //         context,
                  //         changePasswordController.currentPasswordFocusNode,
                  //         changePasswordController.confirmPasswordFocusNode);
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Confirm Password
                  CustomTextFeild(
                    controller:
                        changePasswordController.confirmPasswordController,
                    currentNode:
                        changePasswordController.confirmPasswordFocusNode,
                    hint: 'Confirm Password',
                    leadingIcon: AppTextFeildIcons.lockIcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                    nextNode: changePasswordController.confirmPasswordFocusNode,
                    onFieldSubmitted: (value) {},
                  ),

                  Spacer(),
                  CustomButton(
                    title: 'Save Info',
                    loading: false,
                    onPressed: () async {
                      // Implement your logic here
                      if (changePasswordController.validate()) {
                        //   log('Save Info');
                        await changePasswordController.saveInfo();
                        //  log('Info Saved');
                      } else {
                        Utils.snackBar('Please fill all the fields', 'Error');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}

class ChangePasswordController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? prevPass;
  //TextEditingController currentPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();
  //final FocusNode currentPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  bool validate() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        numberController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  importInfoInTextField(Map info) {
    nameController.text = info['name'] ?? '';
    emailController.text = info['email'] ?? '';
    numberController.text = info['phoneNumber'] ?? '';
    prevPass = info['password'] ?? '';
    log(prevPass.toString());
  }

  saveInfo() async {
    if (prevPass == confirmPasswordController.text) {
      //log('password matched');
      FirebaseServices firebaseServices = FirebaseServices();
      bool up = await firebaseServices.updateUserInfo(
          FirebaseAuth.instance.currentUser!.uid,
          nameController.text,
          emailController.text,
          numberController.text);
      //log(up.toString());
      if (up) {
        Utils.snackBar('Info saved successfully', 'Success');
        // DashboardController dashboardController = Get.find();
        // dashboardController.changeIndex(0);

        Get.offAllNamed(RouteName.dashboardScreen);
      } else {
        Utils.snackBar('Error while saving info', 'Error');
      }
    } else {
      Utils.snackBar('Password does not match', 'Error');
    }
  }
}
