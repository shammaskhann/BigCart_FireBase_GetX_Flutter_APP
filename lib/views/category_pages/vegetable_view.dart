import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/view_models/controller/Featured-Items/featureitem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VegetableCategoryView extends StatelessWidget {
  const VegetableCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    FeaturedItemController featuredItemController =
        Get.put(FeaturedItemController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            )),
        centerTitle: true,
        title: const Text('Vegetable',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          )
        ],
      ),
      backgroundColor: const Color(0xFFF4F5F9),
    );
  }
}
