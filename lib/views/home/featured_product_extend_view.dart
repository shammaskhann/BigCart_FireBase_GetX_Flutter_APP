import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/views/home/home_controller.dart';
import 'package:big_cart_app/widgets/ItemCard.dart';
import 'package:flutter/material.dart';

class FeaturedProductExtendedView extends StatelessWidget {
  const FeaturedProductExtendedView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title:
            const Text('Featured Products', style: AppTextStyles.appBarStyle),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: homeController.getFeaturedList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 4 / 5,
                          ),
                          itemBuilder: ((context, index) {
                            Map currentItem = snapshot.data[index];
                            return ItemCard(
                              item: currentItem,
                              isFeatured: true,
                            );
                          }));
                    }
                    return const Center(
                        child: Text('No Featured Product Availble',
                            style: AppTextStyles.appBarStyle));
                  }))
        ],
      ),
    );
  }
}
