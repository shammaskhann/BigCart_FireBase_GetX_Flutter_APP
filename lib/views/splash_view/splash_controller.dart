import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  isLogin() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user == null) {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.loginScreen);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.homeScreen);
    }
  }
}
