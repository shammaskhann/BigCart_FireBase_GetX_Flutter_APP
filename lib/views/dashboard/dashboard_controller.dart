import 'dart:developer';

import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  Future<void> navigateToCartScreen() async {
    HomeController homeController = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    // log('navigateToCartScreen');
    await Get.toNamed(RouteName.cartScreen);
    // log('Refresh Home');
    homeController.refresh();
  }

  changeIndex(int index) async {
    HomeController homeController = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    currentIndex.value = index;
    if (index == 0) {
      homeController.refresh();
    }
  }

  void navigateToProfileScreen() async {
    await Get.toNamed(RouteName.profileScreen);
  }

  void navigateToFavouriteScreen() async {
    Get.toNamed(RouteName.favouriteScreen);
  }

  void navigateToHomeScreen() {
    Get.toNamed(RouteName.homeScreen);
  }
}
