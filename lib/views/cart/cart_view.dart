import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/cart/CartView_Controller.dart';
import 'package:big_cart_app/views/cart/widgets/Item_Card2.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';

import 'package:flutter/material.dart';

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
      ),
      body: Column(
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

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: AppColors.grey,
                          highlightColor: Colors.grey[100]!,
                          child: const ItemCard2(
                            item: {
                              'isAvailable': true,
                              'weightPer': 'dozen',
                              'quantity': 1,
                              'reviews': [
                                {
                                  'review': 'Sweet and juicy',
                                  'rating': 5,
                                  'name': 'Emma White'
                                },
                                {
                                  'review': 'Perfect for breakfast',
                                  'name': 'Mason Clark',
                                  'rating': 4.5
                                },
                                {
                                  'review': 'Great for fresh-squeezed juice',
                                  'rating': 4,
                                  ' name': ' Ella Adams'
                                },
                                {
                                  'review': ' Always have oranges at home',
                                  'name': 'Carter Ward',
                                  ' rating': 5
                                }
                              ],
                              'imagePath': 'Fruits/Orange.png',
                              'price': 8.0,
                              'description':
                                  'Oranges are a classic citrus fruit celebrated for their juicy and sweet taste. Packed with vitamin C, oranges are a go-to snack for a boost of energy and immune support. Whether you peel them, juice them, or use them in recipes, oranges add a burst of sunshine to your day.',
                              'isFeatured': true,
                              'colorScheme': 'orange',
                              'productName': ' Orange'
                            },
                          ),
                        );
                      });
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Padding(
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
                            FutureBuilder(
                                future: cartController.getSubTotal(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Text('No Item Selected',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('Loading',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }

                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\$ ${snapshot.data!.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    );
                                  }
                                  return const Text('Some Error Occurred');
                                })
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
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
                            FutureBuilder(
                                future: cartController.getShippingCharges(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Text('No Item Selected',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('Loading',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\$ ${snapshot.data!.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    );
                                  }
                                  return const Text('Some Error Occurred');
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
                              padding: EdgeInsets.only(left: 10.0),
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
                                    return const Text('No Item Selected',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }
                                  if (snapsot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('Loading',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400));
                                  }
                                  if (snapsot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\$ ${snapsot.data!.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
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
                          onPressed: () {},
                        )
                      ],
                    )
                  : const Center(
                      child: Text('No Item in Cart'),
                    ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
