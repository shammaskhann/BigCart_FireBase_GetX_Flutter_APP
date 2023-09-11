import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:get/get.dart';

class SplashServices {
  splashTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(RouteName.loginScreen);
  }
}
