import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/views/shipping/shipping_Controller.dart';
import 'package:big_cart_app/views/shipping/widgets/customTextfield.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShippingInfoScreen extends StatelessWidget {
  const ShippingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingController shippingController = Get.put(ShippingController());
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shipping Address', style: AppTextStyles.appBarStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.check,
                            color: AppColors.white,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'DELIVERY',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.primaryColor,
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'ADDRESS',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.white,
                        child: Text(
                          '3',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'PAYMENT',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CustomTextFeild(
              controller: shippingController.nameController.value,
              currentNode: shippingController.nameFocusNode.value,
              nextNode: shippingController.emailFocusNode.value,
              hint: 'name'.tr,
              leadingIcon: AppTextFeildIcons.profileIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    shippingController.nameFocusNode.value,
                    shippingController.emailFocusNode.value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //Email
            CustomTextFeild(
              controller: shippingController.emailController.value,
              currentNode: shippingController.emailFocusNode.value,
              nextNode: shippingController.phoneFocusNode.value,
              hint: 'email'.tr,
              leadingIcon: AppTextFeildIcons.emailIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    shippingController.emailFocusNode.value,
                    shippingController.phoneFocusNode.value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //Phone
            CustomTextFeild(
              controller: shippingController.phoneController.value,
              currentNode: shippingController.phoneFocusNode.value,
              nextNode: shippingController.addressFocusNode.value,
              hint: 'phone'.tr,
              leadingIcon: AppTextFeildIcons.phoneIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    shippingController.phoneFocusNode.value,
                    shippingController.addressFocusNode.value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //Address
            CustomTextFeild(
              controller: shippingController.addressController.value,
              currentNode: shippingController.addressFocusNode.value,
              nextNode: shippingController.cityFocusNode.value,
              hint: 'address'.tr,
              leadingIcon: AppTextFeildIcons.locationIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    shippingController.addressFocusNode.value,
                    shippingController.cityFocusNode.value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //City
            CustomTextFeild(
              controller: shippingController.cityController.value,
              currentNode: shippingController.cityFocusNode.value,
              nextNode: shippingController.zipCodeFocusNode.value,
              hint: 'city'.tr,
              leadingIcon: AppTextFeildIcons.cityIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    shippingController.cityFocusNode.value,
                    shippingController.zipCodeFocusNode.value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //Zip Code
            CustomTextFeild(
              controller: shippingController.zipCodeController.value,
              currentNode: shippingController.zipCodeFocusNode.value,
              nextNode: shippingController.zipCodeFocusNode.value,
              hint: 'zip_code'.tr,
              leadingIcon: AppTextFeildIcons.zipCodeIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your zip code';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                shippingController.zipCodeFocusNode.value.unfocus();
              },
            ),
            CustomButton(
                title: 'Next',
                loading: false,
                onPressed: () {
                  if (shippingController.validate()) {
                    Get.offNamed(RouteName.paymentScreen);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please fill all the required fields',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.white,
                      margin: const EdgeInsets.only(bottom: 10.0),
                    );
                  }
                })
          ],
        ),
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
