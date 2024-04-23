import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../resources/Icons/textfield_icons.dart';
import '../../resources/TextStyle/text_styles.dart';
import '../../resources/color/colors.dart';
import '../../utils/utils.dart';
import 'signup_controller.dart';
import '../../widgets/CustomButon.dart';
import 'Widget/signup_appbar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              const SignupAppBar(),
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
                                //PassWord
                                Obx(
                                  () => TextFormField(
                                    controller:
                                        signupController.phoneController.value,
                                    focusNode: signupController
                                        .passwordConfirmFocusNode.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'name_empty'.tr;
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      signupController
                                          .passwordConfirmFocusNode.value
                                          .unfocus();
                                    },
                                    style: AppTextStyles.textfieldInputStyle,
                                    cursorColor: AppColors.primaryColor,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        left: 25,
                                        top: 25,
                                        bottom: 25,
                                      ),
                                      fillColor: AppColors.white,
                                      hintText: 'name_hint'.tr,
                                      hintStyle: AppTextStyles.substitle,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: SvgPicture.asset(
                                          AppTextFeildIcons.profileIcon,
                                          // ignore: deprecated_member_use
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //email address
                                TextFormField(
                                  controller:
                                      signupController.emailController.value,
                                  focusNode:
                                      signupController.emailFocusNode.value,
                                  style: AppTextStyles.textfieldInputStyle,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: AppColors.primaryColor,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'email_empty'.tr;
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    Utils.fieldFocusChange(
                                        context,
                                        signupController.emailFocusNode.value,
                                        signupController
                                            .passwordFocusNode.value);
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                Obx(
                                  () => TextFormField(
                                    controller: signupController
                                        .passwordController.value,
                                    focusNode: signupController
                                        .passwordFocusNode.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password_empty'.tr;
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusChange(
                                          context,
                                          signupController
                                              .passwordFocusNode.value,
                                          signupController
                                              .passwordConfirmFocusNode.value);
                                    },
                                    style: AppTextStyles.textfieldInputStyle,
                                    obscureText: signupController
                                        .isPasswordNotVisible.value,
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
                                              signupController
                                                  .isPasswordNotVisible
                                                  .toggle();
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
                                // const SizedBox(
                                //   height: 10,
                                // ),

                                //Login Button
                                Obx(
                                  () => CustomButton(
                                    title: 'Signup'.tr,
                                    loading: signupController.loading.value,
                                    onPressed: () {
                                      if (form.currentState!.validate()) {
                                        signupController.authSignup();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                signupController.navigateToLoginScreen();
                              },
                              child: RichText(
                                text: const TextSpan(
                                    text: 'Already have an account? ',
                                    style: AppTextStyles.substitle,
                                    children: [
                                      TextSpan(
                                        text: ' Login',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
