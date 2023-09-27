import 'package:big_cart_app/view_models/controller/Featured-Items/featureitem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/Icons/common_icons.dart';
import '../resources/color/colors.dart';

class ItemCard extends StatelessWidget {
  final item;
  const ItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FeaturedItemController featuredItemController = FeaturedItemController();
    return Container(
      // margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      // height: 250,
      // width: 200,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              FutureBuilder(
                future:
                    featuredItemController.getFeaturedImage(item['imagePath']),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightGreenShade,
                        ),
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
                item['category'],
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Text('dozen',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              const Divider(
                color: Color(0xFFEBEBEB),
                thickness: 1,
              ),
              Row(
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
