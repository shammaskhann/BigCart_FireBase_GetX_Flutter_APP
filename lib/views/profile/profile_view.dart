import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: Get.height * 0.75,
                  width: Get.width,
                  color: AppColors.greyBackGround,
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.aboutIcon),
                        title: Text(
                          "About me",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.orderIcon),
                        title: Text("My Order",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.favouriteIcon),
                        title: Text("My Favourite",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.locationIcon),
                        title: Text("My Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.creditCardIcon),
                        title: Text("My Credit Card",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.transactionIcon),
                        title: Text("My Transactions",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.notificationIcon),
                        title: Text("Notification",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.signoutIcon),
                        title: Text("Sign Out",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
                child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImages.profilePic),
                ),
                Text(
                  "Olivia Rodrigo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "olivia@gmail.com",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),
        ],
      ),
    ));
  }
}
