import 'package:cloud_firestore/cloud_firestore.dart';

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
}
