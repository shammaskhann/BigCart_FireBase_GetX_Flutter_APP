import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartServices {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<bool> addToCart(Map<String, dynamic> item, int quantity) async {
    item['quantity'] = quantity;
    List? cart = [];
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'cart': FieldValue.arrayUnion([item])
      });
      return true;
    } catch (e) {
      log('error : $e');
      return false;
    }
  }

  // Future<bool> updateCart(Map<String, dynamic> item, int quantity) async {
  //   item['quantity'] = quantity;

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser?.uid)
  //         .update({
  //       'cart': FieldValue.arrayUnion([item])
  //     });
  //     return true;
  //   } catch (e) {
  //     log('error : $e');
  //     return false;
  //   }
  // }
  Future<bool> updateCart(Map<String, dynamic> oldItem,
      Map<String, dynamic> newItem, int quantity) async {
    newItem['quantity'] = quantity;

    try {
      final response = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      var data = response.data() as Map<String, dynamic>;
      List cart = data['cart'] ?? [];
      for (int i = 0; i < cart.length; i++) {
        String productName = cart[i]['productName'];
        String itemProductName = oldItem['productName'];
        if (productName.toLowerCase() == itemProductName.toLowerCase()) {
          cart[i] = newItem;
          break;
        }
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({'cart': cart});
      return true;
    } catch (e) {
      log('UpdateCart error : $e');
      return false;
    }
  }

  Future<bool> removeFromCart(Map<String, dynamic> item) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'cart': FieldValue.arrayRemove([item])
      });
      return true;
    } catch (e) {
      log('error : $e');
      return false;
    }
  }

  Future<List<dynamic>?> getCart() async {
    Map<String, dynamic>? item = {};
    List? cart = [];
    try {
      // log('uid $uid');
      final response =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      // log('response : ${response.data()}');
      item = response.data();
      cart = item?['cart'];
      return cart;
    } catch (e) {
      log('getCart error : $e');
      return cart;
    }
  }

  Future<int> getCartCount() async {
    Map<String, dynamic>? item = {};
    List? cart = [];
    try {
      // log('uid $uid');
      final response =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      // log('response : ${response.data()}');
      item = response.data();
      cart = item?['cart'];
      return cart!.length;
    } catch (e) {
      log('getCartCount error : $e');
      return cart!.length;
    }
  }

  Future<int> itemAlreadyInCart(Map item) async {
    List cart = [];
    int index = -1;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        var data = value.data() as Map<String, dynamic>;
        cart = data['cart'] ?? [];
      });
      for (int i = 0; i < cart.length; i++) {
        String productName = cart[i]['productName'];
        String itemProductName = item['productName'];
        if (productName.toLowerCase() == itemProductName.toLowerCase()) {
          index = cart[i]['quantity'];
          break;
        }
      }
      return index;
    } catch (e) {
      log('error : $e');
      return index;
    }
  }

  Future<void> clearCart() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({'cart': []});
    } catch (e) {
      log('error : $e');
    }
  }
}
