import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/views/home_view/main_banner/banner1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../resources/TextStyle/text_styles.dart';
import '../../view_models/controller/searchbar_controller.dart';
import 'categories_list/categories_list.dart';
import 'featured_list/featured_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchbarcontroller = Get.put(SearchBarController());
    FloatingSearchBarController controller = FloatingSearchBarController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              child: SizedBox(
                height: Get.height * 0.9,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeBanner1(),
                    const CategoriesBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 30,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Featured products',
                                style: AppTextStyles.heading),
                            //const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.grey,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: FeaturedList()),
                  ],
                ),
              ),
            ),
            //SearchBar
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Obx(
                  () => FloatingSearchBar(
                      controller:
                          searchbarcontroller.floatingsearchbarcontroller,
                      queryStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      backgroundColor: AppColors.greyBackGround,
                      accentColor: AppColors.priamryButton2,
                      backdropColor: Colors.transparent,
                      progress: searchbarcontroller.isSearching.value,
                      leadingActions: [
                        SvgPicture.asset(AppTextFeildIcons.searchIcon,
                            color: AppColors.priamryButton2),
                      ],
                      actions: [
                        FloatingSearchBarAction(
                          showIfOpened: false,
                          child: SvgPicture.asset(
                            AppTextFeildIcons.filterIcon,
                          ),
                        ),
                      ],
                      onQueryChanged: (query) {
                        // Set the query value
                        searchbarcontroller.query.value = query;
                        // Update suggestion list
                        searchbarcontroller.suggestionList();
                        // Set isSearching based on query
                        searchbarcontroller.isSearching.value =
                            query.isNotEmpty;
                      },
                      onSubmitted: (query) {
                        query = searchbarcontroller.query.value;
                        print(query);
                        searchbarcontroller.isSearching.value = false;
                        controller.close();
                      },
                      clearQueryOnClose: true,
                      hint: 'Search...',
                      hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionCurve: Curves.easeInOut,
                      physics: const BouncingScrollPhysics(),
                      openAxisAlignment: 0.0,
                      debounceDelay: const Duration(milliseconds: 500),
                      builder: (context, transition) {
                        return Obx(() => (searchbarcontroller.isSearching.value)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Material(
                                  color: AppColors.greyBackGround,
                                  elevation: 4.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: searchbarcontroller.suggestion
                                        .map((suggestion) {
                                      return ListTile(
                                        title: Text(suggestion),
                                        onTap: () {
                                          print(suggestion);
                                          controller.query =
                                              suggestion.toString();
                                          // Dismiss the search bar
                                          print(controller.query);
                                          searchbarcontroller
                                              .isSearching.value = false;
                                          controller.close();
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container());
                      }),
                )),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, right: 5),
        child: FloatingActionButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Utils.snackBar('Success', 'Logged Out Successfully');
              Get.offAllNamed('/login');
            },
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(AppIcons.cartIcon)),
      ),
    );
  }
}
