import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/views/cart_view/cart_view.dart';
import 'package:big_cart_app/views/category_view/category_view.dart';
import 'package:big_cart_app/views/favourite_view/favourite_view.dart';
import 'package:big_cart_app/views/login_view/login_view.dart';
import 'package:big_cart_app/views/profile_view/profile_view.dart';
import 'package:big_cart_app/views/review_view/review_view.dart';
import 'package:big_cart_app/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

import '../../views/home_view/home_view.dart';
import '../../views/product_view/product_view.dart';
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
      GetPage(
          name: RouteName.signupScreen,
          page: () => const SignupScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: RouteName.categoryScreen,
          arguments: Get.arguments,
          page: () => CategoryView(
                category: Get.arguments,
              ),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: RouteName.productScreen,
          page: () => ProductView(
                item: Get.arguments,
              ),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: RouteName.reviewScreen,
          page: () => ReviewView(
                review: Get.arguments,
              ),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
        name: RouteName.favouriteScreen,
        page: () => const FavouriteView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: RouteName.profileScreen,
        page: () => const ProfileView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: RouteName.cartScreen,
        page: () => const CartView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
  }
}
