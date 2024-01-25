import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/payment/payment_controller.dart';
import 'package:big_cart_app/views/shipping/shipping_Controller.dart';
import 'package:big_cart_app/views/shipping/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingController shippingController = Get.put(ShippingController());
    PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment Method', style: AppTextStyles.appBarStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
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
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                        )),
                    SizedBox(
                      height: 5,
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
                      backgroundColor: AppColors.primaryColor,
                      child: Text(
                        '3',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppTextFeildIcons.paypalIcon,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Paypal',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppTextFeildIcons.creditcardIcon,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Credit Card',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppTextFeildIcons.applepay,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Apple Pay',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Stack(
              children: [
                SvgPicture.asset(AppImages.card),
                Positioned(
                  top: 60,
                  left: 20,
                  child: Obx(
                    () => Text(
                      paymentController.cardNumberForCard.value,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  child: Text(
                    'Card Holder Name',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 20,
                  child: Obx(
                    () => Text(
                      paymentController.cardHolderNameForCard.value,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 20,
                  child: Text(
                    'Expiry Date',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: 140,
                  right: 20,
                  child: Obx(
                    () => Text(
                      paymentController.cardExpiryDateForCard.value,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomTextFeild(
            controller: paymentController.cardHolderName.value,
            currentNode: paymentController.cardHolderNameFocusNode.value,
            nextNode: paymentController.cardNumberFocusNode.value,
            hint: "Name",
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
            leadingIcon: AppTextFeildIcons.profileIcon,
          )
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
