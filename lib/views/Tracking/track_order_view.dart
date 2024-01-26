import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Track Order', style: AppTextStyles.appBarStyle),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              leading: Text('Order ID: 1234567890'),
              trailing: Text('Delivered'),
            ),
          ],
        ));
  }
}
