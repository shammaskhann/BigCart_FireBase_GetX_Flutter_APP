import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/login_view/widget/appBar.dart';
import 'package:big_cart_app/views/login_view/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,d
          children: [
            const LoginAppBar(),
            //Login TextFeild
            Positioned(
              bottom: 0,
              child: Container(
                //margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(top: 20),
                //height: Get.height * 0.5,
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
                      const LoginForm(),
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
