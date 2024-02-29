import 'package:big_cart_app/resources/Icons/categories_icon.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoryExtendView extends StatelessWidget {
  CategoryExtendView({super.key});

  final List categoriesIcon = [
    {
      'name': 'vegetables'.tr,
      'icon': AppCategoriesIcon.vegIcon,
      'backgroundColor': AppColors.lightGreenShade,
      'onTap': () {
        Get.toNamed('/categoryScreen', arguments: 'Vegetables');
      },
    },
    {
      'name': 'fruits'.tr,
      'icon': AppCategoriesIcon.fruitIcon,
      'backgroundColor': AppColors.lightRedShade,
      'onTap': () {
        Get.toNamed('/categoryScreen', arguments: 'Fruits');
      },
    },
    {
      'name': 'drink'.tr,
      'icon': AppCategoriesIcon.drinkIcon,
      'backgroundColor': AppColors.lightOrangeShade,
      'onTap': () {
        Get.toNamed('/categoryScreen', arguments: 'Drink');
      },
    },
    {
      'name': 'grocery'.tr,
      'icon': AppCategoriesIcon.groceryIcon,
      'backgroundColor': AppColors.lightVoiletShade,
      'onTap': () {
        Get.toNamed('/categoryScreen', arguments: 'Grocery');
      },
    },
    {
      'name': 'edible Oil'.tr,
      'icon': AppCategoriesIcon.edibleOilIcon,
      'backgroundColor': AppColors.lightBlueShade,
      'onTap': () {
        Get.toNamed('/categoryScreen', arguments: 'Edible Oil');
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text('Categories', style: AppTextStyles.appBarStyle),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categoriesIcon.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: categoriesIcon[index]['onTap'],
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: categoriesIcon[index]
                              ['backgroundColor'],
                          radius: 30,
                          child: SvgPicture.asset(
                            categoriesIcon[index]['icon'],
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          categoriesIcon[index]['name'],
                          style: AppTextStyles.substitle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
