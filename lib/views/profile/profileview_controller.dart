import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  void logout() {
    FirebaseAuth.instance.signOut();
    Utils.snackBar('Success', 'Logged Out Successfully');
    Get.offAllNamed('/login');
  }

  Future<String> getName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseServices firebaseServices = FirebaseServices();
    Map info = await firebaseServices.getUserInfo(uid);
    String? name = info['name'] ?? '';
    return info['name'];
  }

  String? getEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }
}
