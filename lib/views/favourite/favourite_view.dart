import 'package:big_cart_app/controller/Favourite_Controller/favourite_controller.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/views/favourite/widgets/fav_itemcard.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = FavouriteController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favourites',
          style: AppTextStyles.appBarStyle,
        ),
      ),
      body: FutureBuilder(
        future: favouriteController.getFavourite(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FavItemCard(item: snapshot.data![index]),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const Center(
            child: Text('No Favourite Items',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          );
        },
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}
