import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {
  isLogin() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    // FirebaseAuth.instance.userChanges().listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
    if (user == null) {
      //await user.reload();
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.loginScreen);
    } else {
      // print("user is login in redirecting to homeScreen");
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.homeScreen);
    }
  }
}
