import 'dart:developer';

import 'package:big_cart_app/services/Firebase/FirebaseService.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchBarController extends GetxController {
  // final List Items = [
  //   'Avacodo',
  //   'Apple',
  //   'Banana',
  //   'Cherry',
  //   'Date',
  //   'Grape',
  //   'Lemon',
  //   'Mango',
  //   'Orange',
  //   'Papaya',
  //   'Pineapple',
  //   'Strawberry',
  //   'Watermelon',
  //   'Onion',
  //   'Potato',
  //   'Tomato',
  //   'Carrot',
  //   'Cucumber',
  //   'Garlic',
  //   'Ginger',
  //   'Lettuce',
  //   'Mushroom',
  //   'Pepper',
  //   'Pumpkin',
  //   'Radish',
  //   'Spinach',
  //   'Sweet Potato',
  //   'Turnip',
  //   'Pepsi',
  //   'Coca Cola',
  //   'Sprite',
  //   'Fanta',
  //   'Mountain Dew',
  //   '7 Up',
  //   'Mirinda',
  //   'Diet Coke',
  //   'Dr Pepper',
  //   'Pepsi Max',
  //   'Coca Cola Zero',
  //   'Olive Oil',
  //   'Castor Oil',
  //   'Coconut Oil',
  //   'Fish Oil',
  //   'Flaxseed Oil',
  //   'Grape Seed Oil',
  //   'Hemp Seed Oil',
  //   'Lard',
  //   'Peanut Oil',
  //   'Sesame Oil',
  //   'Soybean Oil',
  //   'Sunflower Oil',
  // ];
  Map? Items;
  FloatingSearchBarController floatingsearchbarcontroller =
      FloatingSearchBarController();
  RxString query = ''.obs;
  RxList suggestion = <Map>[].obs;
  RxBool isSearching = false.obs;
  RxBool isSelected = false.obs;

  initializeProducts() async {
    log('Product Initialize');
    Map allitems;
    FirebaseServices firebaseServices = FirebaseServices();
    allitems = await firebaseServices.getAllProducts();
    //log('All Items : ' + allitems.toString());
    Items = allitems;
    log('Items : ' + Items.toString());
  }

  suggestionList() {
    log('Item List' + Items.toString());
    suggestion.clear();
    Items!.forEach((key, value) {
      if (key.toLowerCase().contains(query.value.toLowerCase())) {
        suggestion.add(value);
      }
    });
    // Items!.forEach((element) {
    //   if (element.toLowerCase().contains(query.value.toLowerCase())) {
    //     suggestion.add(element);
    //   }
    // });
    log('suggestionList : ' + suggestion.toString());
  }
}
