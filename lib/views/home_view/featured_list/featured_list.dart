import 'package:big_cart_app/view_models/controller/Featured-Items/featureitem_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    FeaturedItemController featuredItemController =
        Get.put(FeaturedItemController());
    return FutureBuilder(
        future: featuredItemController.getFeaturedItems(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  final currentItem = snapshot.data[index];
                  return Container(
                    color: Colors.red,
                    child: Text(currentItem['productName']),
                  );
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
