import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:big_cart_app/controller/Cart_Contrller/cart_controller.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/views/product/product_controller.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color/colors.dart';
import '../../services/Firebase/FirebaseService.dart';

class ProductView extends StatelessWidget {
  final Map<String, dynamic> item;
  const ProductView({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = FirebaseServices();
    ProductController productController =
        Get.put(ProductController(item: item));
    CartController cartController = CartController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(item['productName'], style: AppTextStyles.appBarStyle),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FutureBuilder(
                future: firebaseServices.getImage(item['imagePath']),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Shimmer(
                      gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white],
                      ),
                      child: CircleAvatar(
                        radius: 100,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        CircleAvatar(
                            radius: 100,
                            backgroundColor: colorShade(item['colorScheme'])),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.network(
                            snapshot.data as String,
                            height: 160,
                            width: 160,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Shimmer(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.white],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              item['productName'],
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontWeight: FontWeight.w600),
              maxLines: 1,
              minFontSize: 20.0,
              maxFontSize: 28.0,
            ),
            const SizedBox(
              height: 05,
            ),
            AutoSizeText(
              item['weightPer'],
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              minFontSize: 15,
              maxFontSize: 20,
            ),
            const SizedBox(
              height: 05,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    // color: colorShade(item['colorScheme']),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        ' \$ ${item['price'].toString()}',
                        style: const TextStyle(
                            color: AppColors.priamryButton2,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        minFontSize: 22.0,
                        maxFontSize: 28.0,
                      ),
                      AutoSizeText(
                        item['productName'],
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.black,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        minFontSize: 22.0,
                        maxFontSize: 28.0,
                      ),
                      AutoSizeText(
                        item['weightPer'],
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 20,
                      ),
                      Row(
                        children: [
                          // Text(
                          //   '${productController.ratingAvgCalculate(item)}',
                          //   style: const TextStyle(
                          //       fontFamily: 'Poppins',
                          //       color: AppColors.black,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          AutoSizeText(
                            '${productController.ratingAvgCalculate(item)}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.black,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            minFontSize: 15,
                            maxFontSize: 20,
                          ),
                          RatingBarIndicator(
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: AppColors.priamryButton2,
                            ),
                            rating: productController.ratingAvgCalculate(item),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                          InkWell(
                            onTap: () {
                              log(item['reviews'].toString());
                              log(item['reviews'].length.toString());
                              productController
                                  .navToReviewScreen(item['reviews']);
                            },
                            child: Text("(${item['reviews'].length} reviews)",
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        item['description'],
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        minFontSize: 16,
                        maxFontSize: 19,
                      ),
                      //Flexible(child: Container()),
                      Spacer(),
                      // For Quantity Increment and decrement
                      Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (productController.quantity.value >
                                          1) {
                                        productController.quantity.value--;
                                      } else {
                                        Get.snackbar('Quantity',
                                            'You can not add less than 1 quantity');
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: AppColors.priamryButton2,
                                    )),
                                Obx(
                                  () => Text(
                                    '${productController.quantity.value}',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (productController.quantity.value <
                                          10) {
                                        productController.quantity.value++;
                                      } else {
                                        Get.snackbar('Quantity',
                                            'You can not add more than 10 quantity');
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColors.priamryButton2,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // For Add to Cart Button
                      FutureBuilder(
                          future: productController.isAlreadyInCart(item),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CustomButton(
                                  title: 'Loading',
                                  loading: true,
                                  onPressed: () {
                                    Utils.toastMessage('Connection Error');
                                  });
                            }
                            if (snapshot.hasData) {
                              return CustomButton(
                                loading: false,
                                title: productController.atc.value
                                    ? 'Item Already in Cart'
                                    : 'Add to Cart',
                                onPressed: () {
                                  if (productController.atc.value) {
                                    Get.toNamed('/cartScreen');
                                  } else {
                                    cartController.addToCart(item);
                                    productController.atc.value = true;
                                  }
                                },
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  colorShade(String colorScheme) {
    switch (colorScheme) {
      case 'green':
        return AppColors.lightGreenShade;
      case 'red':
        return AppColors.lightRedShade;
      case 'orange':
        return AppColors.lightOrangeShade;
      case 'voilet':
        return AppColors.lightVoiletShade;
      case 'blue':
        return AppColors.lightBlueShade;
      default:
        return AppColors.lightGreenShade;
    }
  }
}
