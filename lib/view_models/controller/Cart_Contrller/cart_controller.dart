import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt quantity = 0.obs;
  final user = FirebaseAuth.instance.currentUser;
  final DocumentReference cartRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid);

  addToCart(Map item) {
    cartRef.update({
      'cart': FieldValue.arrayUnion([item])
    });
  }

  removeFromCart(Map item) {
    cartRef.update({
      'cart': FieldValue.arrayRemove([item])
    });
  }

  isAlreadyInCart(Map item) {
    //check from database if item map is already in cart if already in cart return item['quantity'] else return 0
    cartRef.get().then((value) {
      if ((value.data() as Map<String, dynamic>)['cart'].contains(item)) {
        print(item['quantity']);
        return item['quantity'];
      } else {
        print(0);
        return 0;
      }
    });
    // cartRef.get().then((value) {
    //   print(value.data());
    //   List cart = (value.data() as Map<String, dynamic>)['cart'];
    //   print(cart);
    //   if (cart.contains(item)) {
    //     return item['quantity'];
    //   } else {
    //     return 0;
    //   }
    // });
  }
}
