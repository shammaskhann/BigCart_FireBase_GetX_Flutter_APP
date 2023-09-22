import 'package:big_cart_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FeaturedItemController {
  DocumentReference inventory =
      FirebaseFirestore.instance.collection('Inventory').doc('Featured-Items');
  Future getFeaturedItems() async {
    try {
      final DocumentSnapshot snapshot = await inventory.get();
      final List list = [];
      final Map<dynamic, dynamic> values = snapshot.data() as Map;
      values.forEach((key, value) {
        list.add(value);
        print(value);
      });
      print(list);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> getFeaturedImage() async {
    final storage = FirebaseStorage.instance;
    try {
      final ref = storage
          .ref('gs://bigcart-flutter-project.appspot.com')
          .child('avocoado.png');
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
