import 'package:big_cart_app/resources/Icons/icons.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/login_view/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginAppBar(),
            //Login TextFeild
            Positioned(
              bottom: 0,
              child: Container(
                //margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(top: 20),
                height: Get.height * 0.5,
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
                      const Text(
                        'Sign in to your account',
                        style: AppTextStyles.substitle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                          child: Column(
                        children: [
                          //email address
                          TextFormField(
                            style: AppTextStyles.textfieldInputStyle,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.primaryColor,
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
                                    AppIcons.emailIcon,
                                    // ignore: deprecated_member_use
                                    color: AppColors.grey,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //PassWord
                          TextFormField(
                            style: AppTextStyles.textfieldInputStyle,
                            obscureText: true,
                            obscuringCharacter: '•',
                            cursorColor: AppColors.primaryColor,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 25,
                                  top: 25,
                                  bottom: 25,
                                ),
                                fillColor: AppColors.white,
                                hintText: 'passowrd'.tr,
                                hintStyle: AppTextStyles.substitle,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none),
                                filled: true,
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    AppIcons.passwordLockIcon,
                                    // ignore: deprecated_member_use
                                    color: AppColors.grey,
                                  ),
                                ),
                                suffixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    AppIcons.passwordVisibleIcon,
                                    // ignore: deprecated_member_use
                                    color: AppColors.grey,
                                  ),
                                )),
                          ),
                          Row(
                            children: [
                              //Switch(value: value, onChanged: (value){ })
                            ],
                          )
                        ],
                      ))
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
