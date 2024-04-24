import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:big_cart_app/views/profile/profileview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewController controller = Get.put(ProfileViewController());

    return Scaffold(
        body: Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: Get.height * 0.8,
              width: Get.width,
              color: AppColors.greyBackGround,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        height: Get.height * 0.2,
                        width: Get.width,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width,
                                color: AppColors.white,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width,
                                color: AppColors.greyBackGround,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: Get.height * 0.06,
                                    backgroundColor:
                                        AppColors.grey.withOpacity(0.5),
                                    child: Center(child: Icon(Icons.person)),
                                  ),
                                  FutureBuilder(
                                    future: controller.getName(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
                                          "Loading...",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }
                                      return Text(
                                        snapshot.data ?? "",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                  Text(
                                    controller.getEmail() ?? "",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  // Container(
                  //   height: Get.height * 0.1,
                  //   width: Get.width,
                  // ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.aboutIcon),
                    title: Text(
                      "About me",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.aboutMeScreen);
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.orderIcon),
                    title: Text("My Order",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.trackOrderScreen);
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.favouriteIcon),
                    title: Text("My Favourite",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.favouriteScreen);
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                  // ListTile(
                  //   leading: SvgPicture.asset(AppIcons.locationIcon),
                  //   title: Text("My Address",
                  //       style: TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.bold)),
                  //   trailing: InkWell(
                  //     child: Icon(Icons.arrow_forward_ios),
                  //     onTap: () {
                  //       Get.toNamed(RouteName.myAddressScreen);
                  //     },
                  //   ),
                  // ),
                  // ListTile(
                  //   leading: SvgPicture.asset(AppIcons.creditCardIcon),
                  //   title: Text("My Credit Card",
                  //       style: TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.bold)),
                  //   trailing: InkWell(
                  //     child: Icon(Icons.arrow_forward_ios),
                  //   ),
                  // ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.transactionIcon),
                    title: Text("My Transactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.transactionScreen);
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.notificationIcon),
                    title: Text("Notification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.notificationScreen);
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.signoutIcon),
                    title: Text("Sign Out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    trailing: InkWell(
                        onTap: () => controller.logout(),
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
