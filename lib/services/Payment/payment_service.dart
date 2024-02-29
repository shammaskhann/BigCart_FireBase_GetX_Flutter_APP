import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentServices {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addToMyOrders(Map<String, dynamic> order) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'orders': FieldValue.arrayUnion([order])
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> getMyOrders() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      var data = response.data() as Map<String, dynamic>;
      List orders = data['orders'] ?? [];
      return orders;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> addToTransactionDetails(Map<String, dynamic> order) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'transactionDetails': FieldValue.arrayUnion([order])
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> getTransactionDetails() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      var data = response.data() as Map<String, dynamic>;
      List transactionDetails = data['transactionDetails'] ?? [];
      return transactionDetails;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
