import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/views/login_view/login_view.dart';
import 'package:get/get.dart';

import '../../views/splash_view/splash_view.dart';

class AppRoutes {
  static List<GetPage> appRoute() {
    return [
      GetPage(
          name: RouteName.splashScreen,
          page: (() => const SplashScreen()),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.loginScreen,
          page: (() => const LoginScreen()),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
    ];
  }
}
