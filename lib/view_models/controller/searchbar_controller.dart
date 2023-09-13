import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchBarController extends GetxController {
  final List Items = [
    'Avacodo',
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Onion',
    'Potato',
    'Tomato',
    'Carrot',
    'Cucumber',
    'Garlic',
    'Ginger',
    'Lettuce',
    'Mushroom',
    'Pepper',
    'Pumpkin',
    'Radish',
    'Spinach',
    'Sweet Potato',
    'Turnip',
    'Pepsi',
    'Coca Cola',
    'Sprite',
    'Fanta',
    'Mountain Dew',
    '7 Up',
    'Mirinda',
    'Diet Coke',
    'Dr Pepper',
    'Pepsi Max',
    'Coca Cola Zero',
    'Olive Oil',
    'Castor Oil',
    'Coconut Oil',
    'Fish Oil',
    'Flaxseed Oil',
    'Grape Seed Oil',
    'Hemp Seed Oil',
    'Lard',
    'Peanut Oil',
    'Sesame Oil',
    'Soybean Oil',
    'Sunflower Oil',
  ];
  FloatingSearchBarController floatingsearchbarcontroller =
      FloatingSearchBarController();
  RxString query = ''.obs;
  RxList suggestion = <String>[].obs;
  RxBool isSearching = false.obs;

  suggestionList() {
    suggestion.clear(); // Clear the previous suggestions
    Items.forEach((element) {
      if (element.toLowerCase().contains(query.value.toLowerCase())) {
        suggestion.add(element);
      }
    });
  }
}
