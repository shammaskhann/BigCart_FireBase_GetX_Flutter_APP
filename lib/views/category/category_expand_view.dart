import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:flutter/material.dart';

class CategoryExtendView extends StatelessWidget {
  const CategoryExtendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text('Category Extend View',
            style: AppTextStyles.appBarStyle),
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
