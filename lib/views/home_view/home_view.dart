import 'dart:developer';
import 'package:big_cart_app/resources/Icons/common_icons.dart';
import 'package:big_cart_app/resources/Icons/textfield_icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/utils/utils.dart';
import 'package:big_cart_app/views/home_view/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../resources/Icons/categories_icon.dart';
import '../../resources/Images/images.dart';
import '../../resources/Routes/route_name.dart';
import '../../resources/TextStyle/text_styles.dart';
import '../../controller/searchbar_controller.dart';
import '../../widgets/ItemCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchbarcontroller = SearchBarController();
    FloatingSearchBarController controller = FloatingSearchBarController();
    HomeController homeController = Get.put(HomeController());
    final List categoriesIcon = [
      {
        'name': 'vegetables'.tr,
        'icon': AppCategoriesIcon.vegIcon,
        'backgroundColor': AppColors.lightGreenShade,
        'onTap': () {
          homeController.navToCategoryScreen('Vegetables');
        },
      },
      {
        'name': 'fruits'.tr,
        'icon': AppCategoriesIcon.fruitIcon,
        'backgroundColor': AppColors.lightRedShade,
        'onTap': () {
          homeController.navToCategoryScreen('Fruits');
        },
      },
      {
        'name': 'drink'.tr,
        'icon': AppCategoriesIcon.drinkIcon,
        'backgroundColor': AppColors.lightOrangeShade,
        'onTap': () {
          homeController.navToCategoryScreen('Drinks');
        },
      },
      {
        'name': 'grocery'.tr,
        'icon': AppCategoriesIcon.groceryIcon,
        'backgroundColor': AppColors.lightVoiletShade,
        'onTap': () {
          homeController.navToCategoryScreen('Grocery');
        },
      },
      {
        'name': 'edible Oil'.tr,
        'icon': AppCategoriesIcon.edibleOilIcon,
        'backgroundColor': AppColors.lightBlueShade,
        'onTap': () {
          homeController.navToCategoryScreen('EdibleOil');
        },
      },
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text(
                'Profile Name Here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Utils.snackBar('Success', 'Logged Out Successfully');
                Get.offAllNamed('/login');
              },
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Change Language'),
                trailing: DropdownButton<String>(
                  value: homeController.selectedLanguage.value,
                  items: <String>['English', 'Urdu']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    log(newValue.toString());
                    homeController.changeLanguage(newValue!);
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Stack(
                        children: [
                          Image.asset(AppImages.homeBanner,
                              height: Get.height * 0.3,
                              width: Get.width,
                              fit: BoxFit.fill),
                          Positioned(
                            left: 30,
                            bottom: 60,
                            child: Text(
                              '20% off on your\nfirst purchase'.tr,
                              style: AppTextStyles.heading,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: SizedBox(
                        height: 150,
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('categories'.tr,
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
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categoriesIcon.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: InkWell(
                                          onTap: categoriesIcon[index]['onTap'],
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    categoriesIcon[index]
                                                        ['backgroundColor'],
                                                child: SvgPicture.asset(
                                                  categoriesIcon[index]['icon'],
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                  categoriesIcon[index]['name'],
                                                  style:
                                                      AppTextStyles.substitle),
                                            ],
                                          )),
                                    );
                                  })),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 30,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Featured products'.tr,
                                style: AppTextStyles.heading),
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
                    Expanded(
                      child: FutureBuilder(
                          future: homeController.getFeaturedList(),
                          builder: ((context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  itemCount: snapshot.data.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 15,
                                          childAspectRatio: Get.height / 910),
                                  itemBuilder: (context, index) {
                                    Map currentItem = snapshot.data[index];
                                    return ItemCard(
                                      item: currentItem,
                                      isFeatured: true,
                                    );
                                  });
                            } else if (!snapshot.hasData) {
                              return const Center(
                                  child: Text(
                                "No Featured Item",
                                style: AppTextStyles.heading,
                              ));
                            } else if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                "Error",
                                style: AppTextStyles.heading,
                              ));
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          })),
                    ),
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
                            // ignore: deprecated_member_use
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
                        searchbarcontroller.query.value = query;
                        searchbarcontroller.suggestionList();
                        searchbarcontroller.isSearching.value =
                            query.isNotEmpty;
                      },
                      onSubmitted: (query) {
                        query = searchbarcontroller.query.value;
                        log(query);
                        searchbarcontroller.isSearching.value = false;
                        controller.close();
                      },
                      clearQueryOnClose: true,
                      hint: 'search_hint_text'.tr,
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
                                          log(suggestion);
                                          controller.query =
                                              suggestion.toString();
                                          // Dismiss the search bar
                                          log(controller.query);
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 15.0, right: 5),
      //   child: FloatingActionButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //         Utils.snackBar('Success', 'Logged Out Successfully');
      //         Get.offAllNamed('/login');
      //       },
      //       backgroundColor: AppColors.primaryColor,
      //       child: SvgPicture.asset(AppIcons.cartIcon)),
      // ),
    );
  }
}
