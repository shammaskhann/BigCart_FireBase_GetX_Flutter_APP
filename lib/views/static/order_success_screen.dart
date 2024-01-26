import 'package:auto_size_text/auto_size_text.dart';
import 'package:big_cart_app/resources/Images/images.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/widgets/CustomButon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Order Success', style: AppTextStyles.appBarStyle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              width: double.infinity,
            ),
            SvgPicture.asset(AppImages.orderSuccess),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              "Your order was succesfull!",
              maxLines: 2,
              minFontSize: 24,
              maxFontSize: 28,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              "You will get a response withina few minutes.",
              maxLines: 2,
              minFontSize: 18,
              maxFontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomButton(
                  title: "Track Order",
                  loading: false,
                  onPressed: () {
                    Get.offNamed(RouteName.trackOrderScreen);
                  }),
            )
          ],
        ));
  }
}
