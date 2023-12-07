import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/ItemCard.dart';

class ItemCard2 extends StatelessWidget {
  final Map item;
  const ItemCard2({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = FirebaseServices();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: 100,
          width: Get.width,
          color: AppColors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: firebaseServices.getImage(item['imagePath']),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Shimmer(
                        gradient: LinearGradient(
                          colors: [AppColors.grey, AppColors.lightGreenShade],
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
                            radius: 50, backgroundColor: colorShade("red")),
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
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$ ${item['price']} x ${item['quantity']}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    item['productName'],
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    item['weightPer'],
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.snackbar(
                          'Item Removed',
                          'Item Removed from Cart',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.primaryColor,
                          colorText: AppColors.white,
                          icon: const Icon(
                            Icons.remove_shopping_cart,
                            color: AppColors.white,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
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
                    Spacer(),
                    const Text(
                      '4',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.snackbar(
                          'Item Added',
                          'Item Added to Cart',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.primaryColor,
                          colorText: AppColors.white,
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.white,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
              )
            ],
          )),
    );
  }
}
