import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/Images/images.dart';
import '../../../resources/color/colors.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.login,
        ),
        Positioned(
          top: 40,
          left: 15,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
