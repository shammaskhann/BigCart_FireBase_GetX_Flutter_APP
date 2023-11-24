import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color/colors.dart';
import '../../services/Firebase/FirebaseService.dart';

class ProductView extends StatelessWidget {
  final Map item;
  const ProductView({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = FirebaseServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            )),
        centerTitle: true,
        title: Text(item['productName'],
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FutureBuilder(
                future: firebaseServices.getImage(item['imagePath']),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Shimmer(
                      gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white],
                      ),
                      child: CircleAvatar(
                        radius: 100,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        CircleAvatar(
                            radius: 100,
                            backgroundColor: colorShade(item['colorScheme'])),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.network(
                            snapshot.data as String,
                            height: 160,
                            width: 160,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Shimmer(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.white],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(item['productName'],
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 20,
            ),
            // Text(item['description'],
            //     style: const TextStyle(
            //         fontFamily: 'Poppins',
            //         color: AppColors.black,
            //         fontSize: 18,
            //         fontWeight: FontWeight.w400)),
          ]),
    );
  }

  colorShade(String colorScheme) {
    switch (colorScheme) {
      case 'green':
        return AppColors.lightGreenShade;
      case 'red':
        return AppColors.lightRedShade;
      case 'orange':
        return AppColors.lightOrangeShade;
      case 'voilet':
        return AppColors.lightVoiletShade;
      case 'blue':
        return AppColors.lightBlueShade;
      default:
        return AppColors.lightGreenShade;
    }
  }
}
