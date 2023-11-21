import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/controller/ListingController/Featured-Items/featureitem_controller.dart';
import 'package:big_cart_app/widgets/ItemCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    late var imageUrl;
    FeaturedItemController featuredItemController =
        Get.put(FeaturedItemController());
    return FutureBuilder(
        future: featuredItemController.getFeaturedItems(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: Get.height / 980),
                itemBuilder: (context, index) {
                  final currentItem = snapshot.data[index];
                  return ItemCard(item: currentItem);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
    // return GridView.builder(
    //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    //     itemCount: 10,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10,
    //         childAspectRatio: 0.8),
    //     itemBuilder: (context, index) {
    //       return Container(
    //         color: Colors.red,
    //       );
    //     });
    // return StreamBuilder(builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
    //   if (snapshot.hasData) {
    //     final List list = [];
    //     final Map<dynamic, dynamic> values = snapshot.data.value;
    //     values.forEach((key, value) {
    //       list.add(value);
    //     });
    //     return GridView.builder(
    //         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    //         itemCount: list.length,
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 10,
    //             mainAxisSpacing: 10,
    //             childAspectRatio: 0.8),
    //         itemBuilder: (context, index) {
    //           return Container(
    //             color: Colors.red,
    //           );
    //         });
    //   }
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // });
  }
}
