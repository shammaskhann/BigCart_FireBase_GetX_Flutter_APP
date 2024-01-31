import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/views/home/home_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  void navigateToCartScreen() async {
    HomeController homeController = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    await Get.toNamed(RouteName.cartScreen);
    homeController.refresh();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void navigateToProfileScreen() async {
    Get.toNamed(RouteName.profileScreen);
  }

  void navigateToFavouriteScreen() async {
    Get.toNamed(RouteName.favouriteScreen);
  }

  void navigateToHomeScreen() {
    Get.toNamed(RouteName.homeScreen);
  }
}
