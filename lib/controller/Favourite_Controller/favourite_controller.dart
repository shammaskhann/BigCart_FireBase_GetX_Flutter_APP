import 'dart:developer';

import 'package:big_cart_app/services/Favourite/favourite_services.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxBool isFavouriteItem = false.obs;

  FavouriteServices favouriteServices = FavouriteServices();

  Future<void> isFavourite(String productName) async {
    bool result = await favouriteServices.isFavourite(productName);
    log('isFavourite: $productName $result');
    isFavouriteItem.value = result;
  }

  Future<bool> addFavourite(Map<String, dynamic> item) async {
    log('addFavourite: $item');
    return await favouriteServices.addFavourite(item);
  }

  Future<bool> removeFavourite(Map<String, dynamic> item) async {
    log('removeFavourite: $item');
    return await favouriteServices.removeFavourite(item);
  }

  Future<List<Map<String, dynamic>>> getFavourite() async {
    return await favouriteServices.getFavourite();
  }
}
