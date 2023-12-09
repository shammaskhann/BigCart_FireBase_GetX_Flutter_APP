import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/views/dashboard/dashboard_controller.dart';
import 'package:big_cart_app/views/favourite/favourite_view.dart';
import 'package:big_cart_app/views/home/home_view.dart';
import 'package:big_cart_app/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/color/colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    return WillPopScope(
        onWillPop: () async {
          if (dashboardController.currentIndex.value == 0) {
            return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Do you want to exit an App'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => exit(0),
                          child: const Text('Yes'),
                        ),
                      ],
                    ));
          } else {
            dashboardController.currentIndex.value = 0;
            return false;
          }
        },
        child: Scaffold(
          body: Obx(() => IndexedStack(
                index: dashboardController.currentIndex.value,
                children: const [
                  HomeScreen(),
                  ProfileView(),
                  FavouriteView(),
                ],
              )),
          bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
                icons: const [
                  Icons.home_outlined,
                  Icons.person_outline,
                  Icons.favorite_border,
                ],
                gapLocation: GapLocation.end,
                notchMargin: 0,
                activeIndex: dashboardController.currentIndex.value,
                onTap: (index) {
                  dashboardController.currentIndex.value = index;
                },
                activeColor: AppColors.priamryButton2,
                inactiveColor: AppColors.grey,
                backgroundColor: AppColors.white,
              )),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              dashboardController.navigateToCartScreen();
            },
            backgroundColor: AppColors.priamryButton2,
            child: SvgPicture.asset(AppIcons.cartIcon),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }
}
