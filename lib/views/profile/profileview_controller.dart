import 'package:big_cart_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  void logout() {
    FirebaseAuth.instance.signOut();
    Utils.snackBar('Success', 'Logged Out Successfully');
    Get.offAllNamed('/login');
  }
}
