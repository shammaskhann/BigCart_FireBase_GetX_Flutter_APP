import 'package:big_cart_app/resources/Icons/icons.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../view_models/controller/searchbar_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchbarcontroller = Get.put(SearchBarController());
    FloatingSearchBarController floatingsearchbarcontroller =
        Get.put(FloatingSearchBarController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Obx(
                () => FloatingSearchBar(
                    controller: searchbarcontroller.floatingsearchbarcontroller,
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
                      SvgPicture.asset(AppIcons.searchIcon,
                          color: AppColors.priamryButton2),
                    ],
                    actions: [
                      FloatingSearchBarAction(
                        showIfOpened: false,
                        child: SvgPicture.asset(
                          AppIcons.filterIcon,
                        ),
                      ),
                    ],
                    onQueryChanged: (query) {
                      // Set the query value
                      searchbarcontroller.query.value = query;

                      // Update suggestion list
                      searchbarcontroller.suggestionList();

                      // Set isSearching based on query
                      searchbarcontroller.isSearching.value = query.isNotEmpty;
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
                                        floatingsearchbarcontroller.query =
                                            suggestion;
                                        // Set the TextField value
                                        floatingsearchbarcontroller.close();
                                        // Dismiss the search bar
                                        searchbarcontroller.isSearching.value =
                                            false;
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
      )),
    );
  }
}
