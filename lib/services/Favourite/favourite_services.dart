import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FavouriteServices {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance
      .collection('users')
      .doc('uid')
      .collection('favourites');
  Future<bool> addFavourite(Map<String, dynamic> item) async {
    try {
      await _db.add(item);
      return true;
    } catch (e) {
      return false;
    }
  }
}
