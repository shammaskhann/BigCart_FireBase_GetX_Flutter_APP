import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  String _paymentMethod = 'Cash';
  RxString cardNumberForCard = ''.obs;
  RxString cardHolderNameForCard = ''.obs;
  RxString cardExpiryDateForCard = ''.obs;
  final cardNumber = TextEditingController().obs;
  final cardNumberFocusNode = FocusNode().obs;
  final cardHolderName = TextEditingController().obs;
  final cardHolderNameFocusNode = FocusNode().obs;
  final cardExpiryDate = TextEditingController().obs;
  final cardExpiryDateFocusNode = FocusNode().obs;
  final cardCVV = TextEditingController().obs;
  final cardCVVFocusNode = FocusNode().obs;

  String getCardLastFourDigit() {
    // if (cardNumberForCard.value.length > 15) {
    //   String fourdigit =
    //       cardNumberForCard.value.substring(cardNumberForCard.value.length - 4);
    //   return "XXXX XXXX XXXX $fourdigit";
    // } else {
    //   return "XXXX XXXX XXXX XXXX";
    // }
    return "XXXX XXXX XXXX XXXX";
  }

  void updateCardNum() {
    cardNumberForCard.value = cardNumber.value.text;
  }

  void updateCardHolderName() {
    cardHolderNameForCard.value = cardHolderName.value.text;
  }

  void updateCardExpiryDate() {
    cardExpiryDateForCard.value = cardExpiryDate.value.text;
  }
}
