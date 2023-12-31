import 'dart:developer';
import 'package:big_cart_app/services/Cart/Cart_Service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt quantity = 1.obs;
  RxBool atc = false.obs;
  final user = FirebaseAuth.instance.currentUser;
  CartServices cartServices = CartServices();
  Future<bool> addToCart(Map<String, dynamic> item) async {
    try {
      await cartServices.addToCart(item, quantity.value);
      atc.value = true;
      return true;
    } catch (e) {
      atc.value = false;
      return false;
    }
  }

  Future<bool> updateCart(Map<String, dynamic> item) async {
    log('item : $item');
    try {
      await cartServices.updateCart(item, item, quantity.value);
      atc.value = true;
      return true;
    } catch (e) {
      atc.value = false;
      return false;
    }
  }

  Future<bool> removeFromCart(Map<String, dynamic> item) async {
    try {
      await cartServices.removeFromCart(item);
      atc.value = false;
      return true;
    } catch (e) {
      atc.value = true;
      return false;
    }
  }

  Future<bool> itemQuantity(Map item) async {
    bool isAlreadyInCart = false;
    final response = await cartServices.itemAlreadyInCart(item);
    if (response != -1) {
      quantity.value = response;
      atc.value = true;
      isAlreadyInCart = true;
    }
    return isAlreadyInCart;
  }

  Future<List<dynamic>?> getCart() async {
    List? itemList = [];
    try {
      final response = await cartServices.getCart();
      itemList = response;
      if (itemList == null) {
        return itemList;
      }
      return itemList;
    } catch (e) {
      return itemList;
    }
  }
}
