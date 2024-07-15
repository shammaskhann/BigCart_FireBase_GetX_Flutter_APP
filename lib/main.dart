import 'package:big_cart_app/resources/languages/languages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    // Inside your widget's build method
    double screenHeight = MediaQuery.of(context).size.height;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoute(),
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: screenHeight * 0.08,
          centerTitle: true,
        ),
      ),
    );
  }
}
