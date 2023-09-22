import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetableCategoryView extends StatelessWidget {
  const VegetableCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: const Text('Vegetable', style: TextStyle(fontFamily: 'Poppins')),
      ),
    );
  }
}
