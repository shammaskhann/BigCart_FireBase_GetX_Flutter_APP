import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/Images/images.dart';
import '../../../resources/color/colors.dart';

class SignupAppBar extends StatelessWidget {
  const SignupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.signup,
          ),
        ),
        Positioned(
          top: 10,
          left: 15,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppTextFeildIcons.backButton,
                // ignore: deprecated_member_use
                color: AppColors.white,
              ),
              Center(
                child: Text(
                  'welcome'.tr,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
