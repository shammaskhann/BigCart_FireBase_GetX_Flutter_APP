import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../utils/utils.dart';

class FirebaseServices {
  Future categoryListing(String category) async {
    final DocumentReference inventory =
        FirebaseFirestore.instance.collection('Inventory').doc(category);
    try {
      final DocumentSnapshot snapshot = await inventory.get();
      final Map<dynamic, dynamic> values = snapshot.data() as Map;
      return values;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Future getFeaturedItems() async {
  //   DocumentReference inventory = FirebaseFirestore.instance
  //       .collection('Inventory')
  //       .doc('Featured-Items');
  //   try {
  //     final DocumentSnapshot snapshot = await inventory.get();
  //     if (snapshot.exists) {
  //       final Map<dynamic, dynamic> values = snapshot.data() as Map;
  //       return values;
  //     } else {
  //       log('Document does not exist');
  //       return null;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  Future getFeaturedItems() {
    CollectionReference inventory =
        FirebaseFirestore.instance.collection('Inventory');
    Map featuredItems = {};
    //it check each document in inventory collection that contains multiple maps of item then it should check each item for key bool isFeatured if its true it add to map and do that for all maps in that docs and return map
    return inventory.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map items = doc.data() as Map;
        items.forEach((key, value) {
          if (value['isFeatured'] == true) {
            featuredItems[key] = value;
          }
        });
      });
      return featuredItems;
    });
  }

  Future<String> getImage(String imagePath) async {
    final storage = FirebaseStorage.instance;
    try {
      final ref = storage.ref().child(imagePath);
      final String url = await ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      Utils.snackBar('Error', 'Error while fetching image');
      print(e);
      return "";
    }
  }
}
