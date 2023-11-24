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

  Future<bool> isAlreadyInCart(Map item) async {
    List cart = [];
    bool isAlreadyInCart = false;
    await cartRef.get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      cart = data['cart'] ?? [];
    });

    for (int i = 0; i < cart.length; i++) {
      String productName = cart[i]['productName'];
      String itemProductName = item['productName'];
      if (productName.toLowerCase() == itemProductName.toLowerCase()) {
        quantity.value = cart[i]['quantity'];
        isAlreadyInCart = true;
        break;
      }
    }
    // cart.forEach((element) {
    //   if (element['productName'] == item['productName']) {
    //     quantity.value = element['quantity'];
    //     isAlreadyInCart = true;
    //   }
    // });
    return isAlreadyInCart;
  }
}
