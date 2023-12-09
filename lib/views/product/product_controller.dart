import 'dart:developer';

import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../controller/Cart_Contrller/cart_controller.dart';

class ProductController extends GetxController {
  final Map item;
  ProductController({required this.item});
  RxInt quantity = 1.obs;
  RxBool atc = false.obs;
  CartController cartController = CartController();
  @override
  void onInit() {
    super.onInit();
    //set busy true while fetching data from server
    isAlreadyInCart(item);
    log('ProductController onInit');
    log(isAlreadyInCart(item).toString());
    log(atc.value.toString());
  }

  double ratingAvgCalculate(Map item) {
    double totalRating = 0;
    int totalUser = 0;
    totalUser = item['reviews'].length;
    item['reviews'].forEach((element) {
      totalRating += element['rating'];
    });
    double ratingAvg = totalRating / totalUser;
    ratingAvg = double.parse(ratingAvg.toStringAsFixed(1));
    return ratingAvg;
  }

  void navToReviewScreen(List reviews) {
    Get.toNamed(RouteName.reviewScreen, arguments: reviews);
  }

  Future<bool> isAlreadyInCart(Map item) async {
    List cart = [];
    bool isAlreadyInCart = false;
    final DocumentReference cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    await cartRef.get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      cart = data['cart'] ?? [];
    });

    for (int i = 0; i < cart.length; i++) {
      String productName = cart[i]['productName'];
      String itemProductName = item['productName'];
      if (productName.toLowerCase() == itemProductName.toLowerCase()) {
        quantity.value = cart[i]['quantity'];
        atc.value = true;
        isAlreadyInCart = true;
        break;
      }
    }
    log(quantity.value.toString());
    log(atc.value.toString());
    return isAlreadyInCart;
  }
}
