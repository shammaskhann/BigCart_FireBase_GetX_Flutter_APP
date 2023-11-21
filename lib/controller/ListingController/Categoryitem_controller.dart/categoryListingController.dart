import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryListingController {
  Future categoryListing(String category) async {
    final DocumentReference inventory =
        FirebaseFirestore.instance.collection('Inventory').doc(category);
    try {
      final DocumentSnapshot snapshot = await inventory.get();
      final List list = [];
      final Map<dynamic, dynamic> values = snapshot.data() as Map;
      values.forEach((key, value) {
        list.add(value);
      });
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
