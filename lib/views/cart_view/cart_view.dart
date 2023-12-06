import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:big_cart_app/views/cart_view/widgets/Item_Card2.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:big_cart_app/widgets/ItemCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = FirebaseServices();
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
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartItemCard();
              }),
          Positioned(
            bottom: 0,
            child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Subtotal',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\$56.7',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Shipping charges',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\$2.5',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.5,
                    color: AppColors.grey,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\$59.2',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    title: 'Checkout',
                    loading: false,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
