import 'dart:developer';
import 'package:big_cart_app/services/Cart/Cart_Service.dart';
import 'package:big_cart_app/views/cart/CartView_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt quantity = 1.obs;
  RxBool atc = false.obs;
  final user = FirebaseAuth.instance.currentUser;
  CartServices cartServices = CartServices();
  Future<bool> addToCart(Map<String, dynamic> item, int quantity) async {
    try {
      await cartServices.addToCart(item, quantity);
      atc.value = true;
      return true;
    } catch (e) {
      atc.value = false;
      return false;
    }
  }

  Future<bool> updateCart(Map<String, dynamic> item) async {
    try {
      await cartServices.updateCart(item, item, quantity.value);
      atc.value = true;
      return true;
    } catch (e) {
      atc.value = false;
      return false;
    }
  }

  Future<bool> updateCartWithQuantity(
      Map<String, dynamic> item, int quantity) async {
    try {
      await cartServices.updateCart(item, item, quantity);
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

  Future<int> getCartCount() async {
    int count = 0;
    try {
      final response = await cartServices.getCart();
      count = response!.length;
      return count;
    } catch (e) {
      return count;
    }
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

  Future<double> getSubTotal() async {
    double subTotal = 0;
    try {
      final response = await cartServices.getCart();
      for (var i = 0; i < response!.length; i++) {
        subTotal += response[i]['price'] * response[i]['quantity'];
      }
      return subTotal;
    } catch (e) {
      return subTotal;
    }
  }

  Future<void> clearCart() async {
    try {
      await cartServices.clearCart();
    } catch (e) {
      log('error : $e');
    }
  }
}
