import 'package:auto_size_text/auto_size_text.dart';
import 'package:big_cart_app/controller/Cart_Contrller/cart_controller.dart';
import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:big_cart_app/views/cart/CartView_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/ItemCard.dart';

class ItemCard2 extends StatelessWidget {
  final Map<String, dynamic> item;
  const ItemCard2({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    bool isAlreadyInCart = false;
    FirebaseServices firebaseServices = FirebaseServices();
    CartController cartController = CartController();
    CartViewController cartViewController = Get.find();
    return Obx(() => (cartController.quantity.value > 0)
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 100,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: firebaseServices.getImage(item['imagePath']),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.grey,
                                  AppColors.lightGreenShade
                                ],
                              ),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                ],
                              ));
                        }
                        if (snapshot.hasData) {
                          return Stack(
                            children: [
                              CircleAvatar(
                                  radius: 50,
                                  backgroundColor: colorShade("red")),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Image.network(
                                  snapshot.data as String,
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.2,
                                ),
                              ),
                            ],
                          );
                        }
                        return Shimmer(
                          gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white],
                          ),
                          child: CircleAvatar(
                            radius: 40,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            '\$ ${item['price']} x ${item['quantity']}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                          ),
                          AutoSizeText(
                            item['productName'],
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            minFontSize: 14,
                            maxFontSize: 18,
                          ),
                          AutoSizeText(
                            item['weightPer'],
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.grey,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    FutureBuilder(
                        future: cartController.itemQuantity(item),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            isAlreadyInCart = snapshot.data as bool;
                            return Obx(() => Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          if (cartController.quantity.value >
                                              9) {
                                            Get.snackbar(
                                              'Max Quantity',
                                              'Max Quantity Reached',
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              colorText: AppColors.white,
                                              icon: const Icon(
                                                Icons.remove_shopping_cart,
                                                color: AppColors.white,
                                              ),
                                            );
                                            return;
                                          } else {
                                            cartController.quantity.value++;
                                            await cartController
                                                .updateCart(item);
                                          }

                                          cartViewController.isUpdate.value++;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                AppIcons.quantityAddIcon,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      AutoSizeText(
                                        cartController.quantity.value
                                            .toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 14,
                                        maxFontSize: 18,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () async {
                                          if (cartController.quantity.value ==
                                              1) {
                                            cartController.quantity.value = 0;
                                            await cartController
                                                .removeFromCart(item);

                                            Get.snackbar(
                                              'Item Removed',
                                              'Item Removed from Cart',
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              colorText: AppColors.white,
                                              icon: const Icon(
                                                Icons.remove_shopping_cart,
                                                color: AppColors.white,
                                              ),
                                            );
                                            int count = await cartController
                                                .getCartCount();
                                            if (count == 0) {
                                              cartViewController.cartNo.value =
                                                  0;
                                            }
                                            cartViewController.isUpdate.value++;
                                            return;
                                          } else {
                                            cartController.quantity.value--;
                                            await cartController
                                                .updateCart(item);
                                          }
                                          cartViewController.isUpdate.value++;
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                AppIcons.quantityRemoveIcon,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          }
                          return const CircularProgressIndicator();
                        }),
                  ],
                )),
          )
        : const SizedBox());
  }
}
