
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/shipping/shipping_Controller.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingMethodScreen extends StatelessWidget {
  const ShippingMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingController shippingController = Get.put(ShippingController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shipping', style: AppTextStyles.appBarStyle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: Text(
                        '1',
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
                      backgroundColor: AppColors.white,
                      child: Text(
                        '2',
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
          Obx(() => InkWell(
                onTap: () {
                  shippingController.standardDelivery();
                },
                child: Container(
                  height: 120, // Increase the height
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        (shippingController.selectedShippingMethod.value == 1)
                            ? const BoxShadow(
                                color: AppColors.primaryColor,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              )
                            : const BoxShadow(
                                color: AppColors.white,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                      ]),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Standard Delivery',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18, // Increase the font size
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10, // Increase the gap
                            ),
                            Text(
                              'Order will be delivered between 3 - 4 business days straights to your doorstep',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 20.0),
                        child: Text(
                          '\$ 3',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Obx(() => InkWell(
                onTap: () {
                  shippingController.nextDayDelivery();
                },
                child: Container(
                  height: 120, // Increase the height
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        (shippingController.selectedShippingMethod.value == 2)
                            ? const BoxShadow(
                                color: AppColors.primaryColor,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              )
                            : const BoxShadow(
                                color: AppColors.white,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                      ]),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next Day Delivery',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18, // Increase the font size
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10, // Increase the gap
                            ),
                            Text(
                              'Place your order before 6pm and your items will be delivered the next day',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 20.0),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Obx(() => InkWell(
                onTap: () {
                  shippingController.nintyMinutesDelivery();
                },
                child: Container(
                  height: 120, // Increase the height
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        (shippingController.selectedShippingMethod.value == 3)
                            ? const BoxShadow(
                                color: AppColors.primaryColor,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              )
                            : const BoxShadow(
                                color: AppColors.white,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                      ]),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ninty Minutes Delivery',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18, // Increase the font size
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10, // Increase the gap
                            ),
                            Text(
                              'Your order will be delivered in 90 minutes or less',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 20.0),
                        child: Text(
                          '\$ 10',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: CustomButton(
                title: 'Next',
                loading: false,
                onPressed: () async {
                  bool isNext = shippingController.nextButtonPressed();
                  if (!isNext) {
                    Get.snackbar(
                      'Error',
                      'Please select a shipping method',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.white,
                    );
                  }
                }),
          )
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
