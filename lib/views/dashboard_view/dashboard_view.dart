import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/Routes/routes.dart';
import 'package:big_cart_app/views/cart_view/cart_view.dart';
import 'package:big_cart_app/views/dashboard_view/dashboard_controller.dart';
import 'package:big_cart_app/views/favourite_view/favourite_view.dart';
import 'package:big_cart_app/views/home_view/home_view.dart';
import 'package:big_cart_app/views/profile_view/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/color/colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: dashboardController.currentIndex.value,
            children: const [
              HomeScreen(),
              ProfileView(),
              FavouriteView(),
              CartView(),
            ],
          )),
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
            icons: const [
              Icons.home_outlined,
              Icons.person_outline,
              Icons.favorite_border,
            ],
            gapLocation: GapLocation.end,
            // gapWidth: 5,

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
          dashboardController.currentIndex.value = 3;
        },
        backgroundColor: AppColors.priamryButton2,
        child: SvgPicture.asset(AppIcons.cartIcon),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
