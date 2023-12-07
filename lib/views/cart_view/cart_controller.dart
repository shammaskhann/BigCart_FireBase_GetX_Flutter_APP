import 'dart:developer';

import 'package:big_cart_app/services/Cart/Cart_Service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartServices cartServices = Get.put(CartServices());

  Future<bool> addCart(Map<String, dynamic> item) async {
    try {
      await cartServices.addCart(item);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getCart() async {
    List? itemList = [];
    try {
      final response = await cartServices.getCart();
      itemList = response;
      if (itemList == null) {
        return itemList!;
      }
      log('cart $itemList');
      return itemList!;
    } catch (e) {
      log('error : $e');
      return itemList!;
    }
  }

  Future<double> getSubTotal() async {
    List itemList = [];
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

  Future<double> getShippingCharges() async {
    double shippingCharges = 0;
    try {
      final response = await cartServices.getCart();
      if (response!.length > 0 && response.length < 3) {
        shippingCharges = 5;
      } else if (response.length > 3 && response.length < 6) {
        shippingCharges = 10;
      } else if (response.length > 6 && response.length < 9) {
        shippingCharges = 15;
      } else if (response.length > 9 && response.length < 12) {
        shippingCharges = 20;
      }

      return shippingCharges;
    } catch (e) {
      log('error : $e');
      return shippingCharges;
    }
  }

  Future<double> getTotal() async {
    double total = 0;
    try {
      double subTotal = await getSubTotal();
      double shippingCharges = await getShippingCharges();
      total = subTotal + shippingCharges;
    } catch (e) {
      // handle error
    }
    return total;
  }
}
