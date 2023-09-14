import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import '../../../resources/Icons/textfield_icons.dart';
import '../../../resources/color/colors.dart';
import '../../../view_models/controller/searchbar_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchbarcontroller = Get.put(SearchBarController());
    FloatingSearchBarController controller = FloatingSearchBarController();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                searchbarcontroller.isSearching.value = query.isNotEmpty;
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
                                  controller.query = suggestion.toString();
                                  // Dismiss the search bar
                                  print(controller.query);
                                  searchbarcontroller.isSearching.value = false;
                                  controller.close();
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : Container());
              }),
        ));
  }
}
