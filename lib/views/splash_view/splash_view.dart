import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/view_models/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices().splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            AppImages.splashBackGround,
          ),
          Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'greeting'.tr,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    AppImages.logo,
                    height: 40,
                    width: 100,
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
