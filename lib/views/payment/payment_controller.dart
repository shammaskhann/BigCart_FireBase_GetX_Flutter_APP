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
    return cardNumberForCard.value
        .substring(cardNumberForCard.value.length - 4);
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
