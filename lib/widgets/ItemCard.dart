import 'package:auto_size_text/auto_size_text.dart';
import 'package:big_cart_app/controller/Favourite_Controller/favourite_controller.dart';

import '../controller/Cart_Contrller/cart_controller.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../resources/Icons/common_icons.dart';
import '../resources/color/colors.dart';
import 'dart:developer';

class ItemCard extends StatelessWidget {
  final item;
  bool? isFeatured = false;
  ItemCard({required this.item, this.isFeatured, super.key});

  @override
  Widget build(BuildContext context) {
    bool isAlreadyInCart = false;
    FirebaseServices firebaseServices = FirebaseServices();
    CartController cartController = CartController();
    FavouriteController favouriteController = FavouriteController();
    String productName = item['productName'];
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.productScreen, arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          )
        ]),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FutureBuilder(
                    future: firebaseServices.getImage(item['imagePath']),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Shimmer(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.priamryButton1,
                              AppColors.lightGreenShade
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 50,
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return Stack(
                          children: [
                            CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    colorShade(item['colorScheme'])),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.network(
                                snapshot.data as String,
                                height: 90,
                                width: 90,
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
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AutoSizeText('\$${item['price']}',
                        minFontSize: 12,
                        maxFontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AutoSizeText(
                    item['productName'],
                    minFontSize: 12,
                    maxFontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AutoSizeText(item['weightPer'].toString(),
                      minFontSize: 12,
                      maxFontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500)),
                ),
                Spacer(),
                const Divider(
                  color: Color(0xFFEBEBEB),
                  thickness: 1,
                ),
                FutureBuilder(
                    future: cartController.itemQuantity(item),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          height: 20,
                          child: Center(
                            child: LinearProgressIndicator(
                              color: AppColors.primaryColor,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        isAlreadyInCart = snapshot.data as bool;
                        return Obx(() => (cartController.atc.value == false)
                            ? Obx(() => InkWell(
                                  onTap: () {
                                    item['quantity'] = 1;
                                    cartController.addToCart(item);
                                    cartController.quantity.value = 1;
                                    cartController.atc.value = true;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.cartIcon,
                                        // ignore: deprecated_member_use
                                        color: AppColors.primaryColor,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Text('add_to_cart'.tr,
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: AppColors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                      Text('${cartController.quantity.value}',
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ))
                            : Obx(
                                () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          log('Quantity: ${cartController.quantity.value}');
                                          if (cartController.quantity.value >
                                              1) {
                                            cartController.quantity.value--;
                                            cartController.updateCart(item);
                                          } else if (cartController
                                                  .quantity.value ==
                                              1) {
                                            cartController.removeFromCart(item);
                                            cartController.atc.value = false;
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.quantityRemoveIcon,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                          cartController.quantity.value
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: AppColors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          log('Quantity: ${cartController.quantity.value}');
                                          if (cartController.quantity.value <
                                              10) {
                                            cartController.quantity.value++;
                                            cartController.updateCart(item);
                                          } else {
                                            Get.snackbar(
                                              'Maximum Quantity',
                                              'Maximum Quantity is 10',
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              colorText: AppColors.white,
                                              icon: const Icon(
                                                Icons.remove_shopping_cart,
                                                color: AppColors.white,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.quantityAddIcon,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                      }
                      return const SizedBox(
                        height: 30,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
                const SizedBox(height: 10),
              ],
            ),
            Positioned(
                top: 5,
                right: 5,
                child: FutureBuilder(
                    future: favouriteController.isFavourite(productName),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.greyBackGround,
                              AppColors.lightRedShade,
                            ],
                          ),
                          child: SvgPicture.asset(
                            AppIcons.heartFillIcon,
                            // ignore: deprecated_member_use
                            color: AppColors.grey,
                            height: 20,
                            width: 20,
                          ),
                        );
                      }
                      return Obx(() => InkWell(
                            onTap: () {
                              if (favouriteController.isFavouriteItem.value ==
                                  false) {
                                favouriteController.addFavourite(item);
                                favouriteController.isFavouriteItem.value =
                                    true;
                                Get.snackbar('Added to Favourite'.tr,
                                    'Item added to favourite successfully'.tr,
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: AppColors.primaryColor,
                                    colorText: AppColors.white,
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                    ));
                              } else {
                                favouriteController.removeFavourite(item);
                                favouriteController.isFavouriteItem.value =
                                    false;
                                Get.snackbar(
                                    'Removed from Favourite'.tr,
                                    'Item removed from favourite successfully'
                                        .tr,
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: AppColors.primaryColor,
                                    colorText: AppColors.white,
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                    ));
                              }
                            },
                            child: SvgPicture.asset(
                              (favouriteController.isFavouriteItem.value ==
                                      false)
                                  ? AppIcons.heartIcon
                                  : AppIcons.heartFillIcon,
                              // ignore: deprecated_member_use
                              color:
                                  (favouriteController.isFavouriteItem.value ==
                                          false)
                                      ? AppColors.grey
                                      : AppColors.red,
                              height: 20,
                              width: 20,
                            ),
                          ));
                    })),
            (isFeatured!)
                ? Positioned(
                    top: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppColors.lightOrangeShade,
                          ),
                          child: Text(
                            'Featured'.tr,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

Color colorShade(String colorScheme) {
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
