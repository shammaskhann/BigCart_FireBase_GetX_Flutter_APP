import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/login/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import '../../resources/Icons/textfield_icons.dart';
import '../../utils/utils.dart';
import '../../widgets/CustomButon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const LoginAppBar(),
            //Login
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.greyBackGround,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome'.tr,
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        'sign_into_your_account'.tr,
                        style: AppTextStyles.substitle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                          key: form,
                          child: Column(
                            children: [
                              //email address
                              TextFormField(
                                controller:
                                    loginController.emailController.value,
                                focusNode: loginController.emailFocusNode.value,
                                style: AppTextStyles.textfieldInputStyle,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppColors.primaryColor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "email_empty".tr;
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  Utils.fieldFocusChange(
                                      context,
                                      loginController.emailFocusNode.value,
                                      loginController.passwordFocusNode.value);
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                      left: 25,
                                      top: 25,
                                      bottom: 25,
                                    ),
                                    fillColor: AppColors.white,
                                    hintText: 'email'.tr,
                                    hintStyle: AppTextStyles.substitle,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    prefixIcon: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: SvgPicture.asset(
                                        AppTextFeildIcons.emailIcon,
                                        // ignore: deprecated_member_use
                                        color: AppColors.grey,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //PassWord
                              Obx(
                                () => TextFormField(
                                  controller:
                                      loginController.passwordController.value,
                                  focusNode:
                                      loginController.passwordFocusNode.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "password_empty".tr;
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    loginController.passwordFocusNode.value
                                        .unfocus();
                                  },
                                  style: AppTextStyles.textfieldInputStyle,
                                  obscureText:
                                      loginController.isPasswordVisible.value,
                                  obscuringCharacter: '•',
                                  cursorColor: AppColors.primaryColor,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        left: 25,
                                        top: 25,
                                        bottom: 25,
                                      ),
                                      fillColor: AppColors.white,
                                      hintText: 'password'.tr,
                                      hintStyle: AppTextStyles.substitle,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: SvgPicture.asset(
                                          AppTextFeildIcons.passwordLockIcon,
                                          // ignore: deprecated_member_use
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      suffixIcon: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: InkWell(
                                          onTap: () {
                                            loginController
                                                    .isPasswordVisible.value =
                                                !loginController
                                                    .isPasswordVisible.value;
                                          },
                                          child: SvgPicture.asset(
                                            AppTextFeildIcons
                                                .passwordVisibleIcon,
                                            // ignore: deprecated_member_use
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              Row(
                                children: [
                                  Obx(() => Switch(
                                      inactiveTrackColor: AppColors.grey,
                                      activeColor: AppColors.primaryColor,
                                      value: loginController.isRememberMe.value,
                                      onChanged: (value) {
                                        loginController.isRememberMe.value =
                                            value;
                                      })),
                                  const Text(
                                    'Remember me',
                                    style: AppTextStyles.substitle,
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'forgot_password'.tr,
                                        style: AppTextStyles.substitle,
                                      )),
                                ],
                              ),
                              //Login Button
                              Obx(
                                () => CustomButton(
                                  title: 'login'.tr,
                                  loading: loginController.loading.value,
                                  onPressed: () {
                                    if (form.currentState!.validate()) {
                                      loginController.authLogin();
                                    }
                                  },
                                ),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      loginController.navigateToSignUpScreen();
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'dont_have_an_account'.tr,
                                          style: AppTextStyles.substitle,
                                          children: [
                                            TextSpan(
                                              text: 'sign_up'.tr,
                                              style: const TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ]),
                                    )),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
