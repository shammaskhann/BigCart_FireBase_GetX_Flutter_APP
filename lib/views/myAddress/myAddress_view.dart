import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/myAddress/myAddress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyAddressController myAddressController = Get.put(MyAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Address', style: AppTextStyles.appBarStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                  tileColor: AppColors.white,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.lightGreenShade,
                    child: Icon(
                      Icons.home,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rousal Austin',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      Text('2811, Crescent Day,LA Port',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 12)),
                      Text('California, United States 77571',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 12)),
                      Text('+1 281-573-0800',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                    ],
                  ),
                  trailing: Obx(
                    () => InkWell(
                      splashColor: AppColors.white,
                      onTap: () {
                        myAddressController.toggleAddress();
                      },
                      child: (myAddressController.isAdressExpanded.isFalse)
                          ? Icon(
                              Icons.arrow_circle_up,
                              color: AppColors.primaryColor,
                            )
                          : Icon(
                              Icons.arrow_circle_down,
                              color: AppColors.primaryColor,
                            ),
                    ),
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => TextFormField(
                        controller: myAddressController.nameController.value,
                        focusNode: myAddressController.nameFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name_empty'.tr;
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          myAddressController.addressFocusNode.value
                              .requestFocus();
                        },
                        style: AppTextStyles.textfieldInputStyle,
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: 25,
                            top: 25,
                            bottom: 25,
                          ),
                          fillColor: AppColors.white,
                          hintText: 'name_hint'.tr,
                          hintStyle: AppTextStyles.substitle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none),
                          filled: true,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              AppTextFeildIcons.profileIcon,
                              // ignore: deprecated_member_use
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
