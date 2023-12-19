import 'package:flutter/material.dart';

import '../color/colors.dart';

class AppTextStyles {
  static const TextStyle substitle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.grey);
  static const TextStyle heading = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: AppColors.black);
  static const TextStyle textfieldInputStyle = TextStyle(
    color: AppColors.grey,
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const appBarStyle = TextStyle(
    color: AppColors.black,
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
