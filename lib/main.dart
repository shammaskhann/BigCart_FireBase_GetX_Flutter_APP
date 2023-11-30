import 'package:big_cart_app/resources/languages/languages.dart';
import 'package:big_cart_app/views/home_view/home_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resources/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoute(),
      translations: Languages(),
      locale: (homeController.selectedLanguage.value == 'English')
          ? const Locale('en', 'US')
          : const Locale('hi', 'IN'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
