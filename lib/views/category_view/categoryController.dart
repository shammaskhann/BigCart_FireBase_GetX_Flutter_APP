import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController {
  FirebaseServices firebaseServices = FirebaseServices();
  final List categoryList = [];

  Future getCatergoryList(String category) async {
    try {
      final response = await firebaseServices.categoryListing(category);
      response.forEach((key, value) {
        categoryList.add(value);
      });
      return categoryList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
