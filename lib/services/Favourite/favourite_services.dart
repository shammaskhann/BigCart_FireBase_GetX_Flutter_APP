import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavouriteServices {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<bool> addFavourite(Map<String, dynamic> item) async {
    final db = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favourites');
    try {
      await db.doc(item['productName']).set(item);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getFavourite() async {
    final db = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favourites');
    List? itemList = [];
    try {
      final response = await db.get();
      itemList = response.docs.map((e) => e.data()).toList();
      //log('getFavourite: $itemList');
      if (itemList.isNotEmpty) {
        return itemList;
      }

      return itemList;
    } catch (e) {
      return itemList!;
    }
  }

  Future<bool> removeFavourite(Map<String, dynamic> item) async {
    final db = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favourites');
    try {
      await db.doc(item['productName']).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isFavourite(String productName) async {
    final db = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favourites');
    try {
      final response = await db.doc(productName).get();
      if (response.data() == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
