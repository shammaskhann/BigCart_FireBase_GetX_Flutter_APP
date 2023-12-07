import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartServices {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<bool> addCart(Map<String, dynamic> item) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cart')
          .add(item);
      return true;
    } catch (e) {
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
      log('error : $e');
      return cart;
    }
  }
}
