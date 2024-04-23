import 'dart:developer';
import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:big_cart_app/services/Payment/payment_service.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future getTransactionDetail() async {
      PaymentServices paymentServices = PaymentServices();
      return await paymentServices.getTransactionDetails();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: FutureBuilder(
        future: getTransactionDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              log(snapshot.data.toString());
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var transaction = snapshot.data![index];
                    IconData? leadingIcon;
                    String paymentMethod = transaction['paymentMethod'];
                    if (paymentMethod == 'Cash') {
                      leadingIcon = Icons.attach_money;
                    } else if (paymentMethod == 'Credit Card') {
                      leadingIcon = Icons.credit_card;
                    } else {
                      leadingIcon = Icons.payment;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: ListTile(
                        tileColor: AppColors.white,
                        iconColor: AppColors.primaryColor,
                        leading: Icon(
                          leadingIcon,
                        ),
                        title: Text(paymentMethod,
                            style: AppTextStyles.appBarStyle),
                        subtitle: Text(
                            _formatDateTime(
                              transaction['orderDate'],
                              transaction['orderTime'],
                            ),
                            style: AppTextStyles.substitle),
                        trailing: Text(
                          '\$${transaction['total'].toStringAsFixed(2)}',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return Center(
                child: Text("No Transaction"),
              );
            }
          }
        },
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }

  String _formatDateTime(String date, String time) {
    // Assuming date format is DD-MM-YYYY and time format is HH:MM AM/PM
    List<String> dateParts = date.split('-');
    List<String> timeParts = time.split(' ');
    String formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
    String formattedTime = timeParts[0] + ' ' + timeParts[1];
    return '$formattedDate, $formattedTime';
  }
}
