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
    CartServices cartController = CartServices();
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
                                height: 80,
                                width: 80,
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
                Text('\$${item['price']}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                Text(
                  productName.tr,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(item['weightPer'],
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                const Divider(
                  color: Color(0xFFEBEBEB),
                  thickness: 1,
                ),
                FutureBuilder(
                    future: cartController.isAlreadyInCart(item),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 20,
                          child: const Center(
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
                                            item['quantity'] =
                                                cartController.quantity.value;
                                            cartController.removeFromCart(item);
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
                                          cartController.quantity.value++;
                                          item['quantity'] =
                                              cartController.quantity.value;
                                          cartController.addToCart(item);
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
                      return Container(
                        height: 30,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    })
              ],
            ),
            Positioned(
              top: 5,
              right: 5,
              child: SvgPicture.asset(
                AppIcons.heartIcon,
                color: AppColors.grey,
                height: 20,
                width: 20,
              ),
            ),
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
