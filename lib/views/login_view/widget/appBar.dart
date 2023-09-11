import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/Images/images.dart';
import '../../../resources/color/colors.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.login,
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/Icons/CommonIcon/BackButtonIcon.svg',
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
