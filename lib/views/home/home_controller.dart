import 'dart:developer';
import 'dart:ui';

import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:get/get.dart';
import '../../resources/Routes/route_name.dart';

class HomeController extends GetxController {
  FirebaseServices firebaseServices = FirebaseServices();
  RxBool isUpdated = false.obs;
  RxString selectedLanguage = 'English'.obs;
  final List featuredList = [];

  getFeaturedList() async {
    final Map<dynamic, dynamic> response =
        await firebaseServices.getFeaturedItems();
    if (response.isNotEmpty) {
      response.forEach((key, value) {
        featuredList.add(value);
        log(value.toString());
      });
      return featuredList;
    } else {
      return null;
    }
  }

  Future<String> getImagePath(String imagePath) async {
    final String response = await firebaseServices.getImage(imagePath);
    return response;
  }

  navToCategoryScreen(String category) {
    Get.toNamed((RouteName.categoryScreen), arguments: category);
  }

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
    if (newLanguage == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (newLanguage == 'Urdu') {
      Get.updateLocale(const Locale('ur', 'PK'));
    }
  }
}
