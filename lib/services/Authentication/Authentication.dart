import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_exception.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<bool> Login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      AuthException.authExceptionToast(e.code);
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  Future<bool> SignUp(String email, String password, String phone) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _db.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'password': password,
        'phoneNumber': phone,
        'uid': userCredential.user!.uid,
      });
      return true;
    } on FirebaseAuthException catch (e) {
      AuthException.authExceptionToast(e.code);
      return false;
    }
  }
}
