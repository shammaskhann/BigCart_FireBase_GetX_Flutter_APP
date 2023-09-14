import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/Images/images.dart';

class HomeBanner1 extends StatelessWidget {
  const HomeBanner1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Stack(
        children: [
          Image.asset(AppImages.homeBanner),
          const Positioned(
            left: 30,
            bottom: 70,
            child: Text(
              '20% off on your\nfirst purchase',
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
