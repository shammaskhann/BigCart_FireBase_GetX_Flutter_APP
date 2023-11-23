import 'package:big_cart_app/controller/Cart_Contrller/cart_controller.dart';
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
  const ItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = FirebaseServices();
    CartController cartController = CartController();
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              FutureBuilder(
                future: firebaseServices.getImage(item['imagePath']),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundColor: colorShade(item['colorScheme'])),
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
              Text('\$${item['price']}',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              Text(
                item['productName'],
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
                      return (snapshot.data == false)
                          ? InkWell(
                              onTap: () {
                                CartController cartController =
                                    CartController();
                                item['quantity'] = 1;
                                cartController.addToCart(item);
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
                                  const Text('Add to cart',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: AppColors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            )
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
                                        if (cartController.quantity.value > 1) {
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
                            );
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
            top: 0,
            right: 5,
            child: SvgPicture.asset(
              AppIcons.heartIcon,
              color: AppColors.grey,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
    );
  }
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