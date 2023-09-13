import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {
  isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Get.offAllNamed(RouteName.homeScreen);
    } else {
      splashTimer();
    }
  }

  splashTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(RouteName.loginScreen);
  }
}
