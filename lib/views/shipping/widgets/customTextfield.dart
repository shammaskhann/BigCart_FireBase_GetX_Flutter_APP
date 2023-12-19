import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String hint;
  final Function(String?) validator;
  final String leadingIcon;
  const CustomTextFeild(
      {required this.controller,
      required this.currentNode,
      required this.nextNode,
      required this.hint,
      required this.validator,
      required this.leadingIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: currentNode,
      style: AppTextStyles.textfieldInputStyle,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        return validator(value);
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, currentNode, nextNode);
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 25,
            bottom: 25,
          ),
          fillColor: AppColors.white,
          hintText: hint,
          hintStyle: AppTextStyles.substitle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          filled: true,
          prefixIcon: Container(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              leadingIcon,
              // ignore: deprecated_member_use
              color: AppColors.grey,
            ),
          )),
    );
  }
}
