import 'package:auto_size_text/auto_size_text.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/cart/CartView_Controller.dart';
import 'package:big_cart_app/views/cart/widgets/Item_Card2.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewController cartController = Get.put(CartViewController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Shopping Cart',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteName.dashboardScreen);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          )),
      body: Obx(() => cartController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Obx(
              () => cartController.cartNo.value > 0
                  ? Column(
                      children: [
                        Expanded(
                          child: FutureBuilder(
                            future: cartController.getCart(),
                            builder: (index, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return ItemCard2(
                                        item: snapshot.data[index],
                                      );
                                    });
                              }
                              if (!snapshot.hasData) {
                                const Center(
                                  child: Text('No Item in Cart'),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                );
                              }
                              return const Center(
                                child: Text('Some Error is Occurred'),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: Get.height * 0.3,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.greyBackGround,
                                  blurRadius: 2,
                                  offset: Offset(0, -1))
                            ],
                          ),
                          child: Obx(
                            () => (cartController.isUpdate.value > 0)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Subtotal',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: AppColors.grey,
                                                  fontSize: Get.width * 0.04,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const Spacer(),
                                          FutureBuilder(
                                              future:
                                                  cartController.getSubTotal(),
                                              builder: (context, snapshot) {
                                                // if (!snapshot.hasData) {
                                                //   return Text(
                                                //       'No Item Selected',
                                                //       style: TextStyle(
                                                //           fontFamily: 'Poppins',
                                                //           color: AppColors.grey,
                                                //           fontSize:
                                                //               Get.width * 0.04,
                                                //           fontWeight:
                                                //               FontWeight.w400));
                                                // }
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Text('Loading',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize:
                                                              Get.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w400));
                                                }

                                                if (snapshot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Text(
                                                      '\$ ${snapshot.data!.toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize:
                                                              Get.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                }
                                                return const Text(
                                                    'Some Error Occurred');
                                              })
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              'Shipping charges (Standard)',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: AppColors.grey,
                                                  fontSize: Get.width * 0.04,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const Spacer(),
                                          FutureBuilder(
                                              future: cartController
                                                  .getShippingCharges(),
                                              builder: (context, snapshot) {
                                                // if (!snapshot.hasData) {
                                                //   return Text(
                                                //       'No Item Selected',
                                                //       style: TextStyle(
                                                //           fontFamily: 'Poppins',
                                                //           color: AppColors.grey,
                                                //           fontSize:
                                                //               Get.width * 0.04,
                                                //           fontWeight:
                                                //               FontWeight.w400));
                                                // }
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Text('Loading',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize:
                                                              Get.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w400));
                                                }
                                                if (snapshot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Text(
                                                      '\$ ${snapshot.data!.toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize:
                                                              Get.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                }
                                                return const Text(
                                                    'Some Error Occurred');
                                              })
                                        ],
                                      ),
                                      const Spacer(),
                                      const Divider(
                                        indent: 10,
                                        endIndent: 10,
                                        thickness: 0.5,
                                        color: AppColors.grey,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              'Total',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: AppColors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const Spacer(),
                                          FutureBuilder(
                                              future: cartController.getTotal(),
                                              builder: (context, snapsot) {
                                                if (!snapsot.hasData) {
                                                  return const Text(
                                                      'No Item Selected',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400));
                                                }
                                                if (snapsot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Text('Loading',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: AppColors.grey,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400));
                                                }
                                                if (snapsot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Text(
                                                      '\$ ${snapsot.data!.toStringAsFixed(2)}',
                                                      style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  );
                                                }
                                                return const LinearProgressIndicator(
                                                  color: AppColors.primaryColor,
                                                );
                                              })
                                        ],
                                      ),
                                      const Spacer(),
                                      CustomButton(
                                        title: 'Checkout',
                                        loading: false,
                                        onPressed: () {
                                          cartController
                                              .navigateToShippingScreen();
                                        },
                                      )
                                    ],
                                  )
                                : const Center(
                                    child: Text('No Item in Cart'),
                                  ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SvgPicture.asset(AppImages.orderSuccess),
                        const SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          "Your Cart is Empty",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          minFontSize: 20,
                          maxFontSize: 26,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          "You will get a response within a few minutes.",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        CustomButton(
                          title: 'Start Shopping',
                          loading: false,
                          onPressed: () {
                            cartController.navigateToHomeScreen();
                          },
                        )
                      ],
                    ),
            )),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
