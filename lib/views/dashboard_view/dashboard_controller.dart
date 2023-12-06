import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  void navigateToCartScreen() {
    Get.toNamed(RouteName.cartScreen);
  }

  void navigateToProfileScreen() {
    Get.toNamed(RouteName.profileScreen);
  }

  void navigateToFavouriteScreen() {
    Get.toNamed(RouteName.favouriteScreen);
  }

  void navigateToHomeScreen() {
    Get.toNamed(RouteName.homeScreen);
  }
}
