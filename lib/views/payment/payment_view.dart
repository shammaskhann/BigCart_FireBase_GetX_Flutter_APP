import 'dart:developer';

import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/payment/payment_controller.dart';
import 'package:big_cart_app/views/shipping/shipping_Controller.dart';
import 'package:big_cart_app/views/shipping/widgets/customTextfield.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingController shippingController = Get.put(ShippingController());
    PaymentController paymentController = Get.put(PaymentController());
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment Method', style: AppTextStyles.appBarStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
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
                        color: AppColors.primaryColor,
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        AppTextFeildIcons.creditcard,
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
                  Obx(
                    () => Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        paymentController.getCardLastFourDigit(),
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
                  Obx(
                    () => Positioned(
                      top: 140,
                      left: 20,
                      child: Text(
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
                  Obx(
                    () => Positioned(
                      top: 140,
                      right: 20,
                      child: Text(
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
            Form(
                key: key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: CustomTextFeild(
                        controller: paymentController.cardHolderName.value,
                        currentNode:
                            paymentController.cardHolderNameFocusNode.value,
                        nextNode: paymentController.cardNumberFocusNode.value,
                        hint: "Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          log('onFieldSubmitted');
                          paymentController.updateCardHolderName();
                          paymentController.cardHolderNameFocusNode.value
                              .unfocus();
                          paymentController.cardNumberFocusNode.value
                              .requestFocus();
                        },
                        leadingIcon: AppTextFeildIcons.profileIcon,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: CustomTextFeild(
                        formater: [
                          MaskTextInputFormatter(
                              mask: '#### #### #### ####',
                              filter: {"#": RegExp(r'[0-9]')})
                        ],
                        controller: paymentController.cardNumber.value,
                        currentNode:
                            paymentController.cardNumberFocusNode.value,
                        nextNode:
                            paymentController.cardExpiryDateFocusNode.value,
                        hint: "Card Number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter card number';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          log('onFieldSubmitted');
                          paymentController.updateCardNum();
                          paymentController.cardNumberFocusNode.value.unfocus();
                          paymentController.cardExpiryDateFocusNode.value
                              .requestFocus();
                        },
                        leadingIcon: AppTextFeildIcons.creditcardIcon,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomTextFeild(
                                formater: [
                                  MaskTextInputFormatter(
                                      mask: '##/##',
                                      filter: {"#": RegExp(r'[0-9]')})
                                ],
                                controller:
                                    paymentController.cardExpiryDate.value,
                                currentNode: paymentController
                                    .cardExpiryDateFocusNode.value,
                                nextNode:
                                    paymentController.cardCVVFocusNode.value,
                                hint: "Expiry Date",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter expiry date';
                                  }
                                  return null;
                                },
                                leadingIcon: AppTextFeildIcons.calendarIcon,
                                onFieldSubmitted: (value) {
                                  log('onFieldSubmitted');
                                  paymentController.updateCardExpiryDate();
                                  paymentController
                                      .cardExpiryDateFocusNode.value
                                      .unfocus();
                                  paymentController.cardCVVFocusNode.value
                                      .requestFocus();
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomTextFeild(
                                  formater: [
                                    MaskTextInputFormatter(
                                        mask: '###',
                                        filter: {"#": RegExp(r'[0-9]')})
                                  ],
                                  controller: paymentController.cardCVV.value,
                                  currentNode:
                                      paymentController.cardCVVFocusNode.value,
                                  nextNode:
                                      paymentController.cardCVVFocusNode.value,
                                  hint: "CVV",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter CVV';
                                    }
                                    return null;
                                  },
                                  leadingIcon: AppTextFeildIcons.lockIcon,
                                  onFieldSubmitted: (value) {
                                    log('onFieldSubmitted');
                                    paymentController.cardCVVFocusNode.value
                                        .unfocus();
                                  }),
                            ),
                          ),
                        ]),
                  ],
                )),
            Obx(() => CustomButton(
                title: "Make a Payment",
                loading: paymentController.isLoading.value,
                onPressed: () {
                  if (key.currentState!.validate()) {
                    paymentController.processTransaction();
                  } else {
                    Get.snackbar('Error', 'Please enter all fields');
                  }
                }))
          ],
        ),
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
