import 'dart:developer';

import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Payment/payment_service.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key});

  Future getOrderDetails() async {
    PaymentServices paymentServices = PaymentServices();
    return await paymentServices.getMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order', style: AppTextStyles.appBarStyle),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getOrderDetails(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              log(snapshot.data.toString());
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var order = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: ListTile(
                      tileColor: AppColors.white,
                      leading: Icon(
                        Icons.local_shipping_outlined,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(
                        'Order #${order['orderNumber']}',
                        style: AppTextStyles.appBarStyle,
                      ),
                      subtitle: Text(
                        'Placed on ${_formatDateTime(order['orderDate'], order['orderTime'])}',
                        style: AppTextStyles.substitle,
                        // Assuming _formatDateTime formats the date and time appropriately
                      ),
                      trailing: Text(
                        'Total: ${order['total'].toStringAsFixed(2)}',
                        style: AppTextStyles.appBarStyle.copyWith(
                          color: AppColors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No Transaction Found'),
              );
            }
          }
        },
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}

String _formatDateTime(String date, String time) {
  // Your date and time formatting logic here
  return '$date';
}
