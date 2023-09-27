import 'package:big_cart_app/resources/Icons/categories_icon.dart';
import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/TextStyle/text_styles.dart';
import '../../../resources/color/colors.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    List categoriesIcon = [
      {
        'name': 'Vegetables',
        'icon': AppCategoriesIcon.vegIcon,
        'backgroundColor': AppColors.lightGreenShade,
        'onTap': () {
          Get.toNamed((RouteName.vegetableScreen));
        },
      },
      {
        'name': 'Fruits',
        'icon': AppCategoriesIcon.fruitIcon,
        'backgroundColor': AppColors.lightRedShade,
        'onTap': () {},
      },
      {
        'name': 'Drink',
        'icon': AppCategoriesIcon.drinkIcon,
        'backgroundColor': AppColors.lightOrangeShade,
        'onTap': () {},
      },
      {
        'name': 'Grocery',
        'icon': AppCategoriesIcon.groceryIcon,
        'backgroundColor': AppColors.lightVoiletShade,
        'onTap': () {},
      },
      {
        'name': 'Edible Oil',
        'icon': AppCategoriesIcon.edibleOilIcon,
        'backgroundColor': AppColors.lightBlueShade,
        'onTap': () {},
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
      ),
      child: SizedBox(
        height: 150,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Categories', style: AppTextStyles.heading),
                  //const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesIcon.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: InkWell(
                          onTap: categoriesIcon[index]['onTap'],
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: categoriesIcon[index]
                                    ['backgroundColor'],
                                child: SvgPicture.asset(
                                  categoriesIcon[index]['icon'],
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(categoriesIcon[index]['name'],
                                  style: AppTextStyles.substitle),
                            ],
                          )),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
