import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/category/categoryController.dart';
import 'package:big_cart_app/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/ItemCard.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({required this.category, super.key});
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteName.dashboardScreen);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        centerTitle: true,
        title: Text(category.tr, style: AppTextStyles.appBarStyle),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: FutureBuilder(
                  future: categoryController.getCatergoryList(category),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 4 / 5),
                          itemBuilder: (context, index) {
                            final currentItem = snapshot.data[index];
                            return ItemCard(
                              item: currentItem,
                              isFeatured: false,
                            );
                          });
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Item Found"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF4F5F9),
    );
  }
}
