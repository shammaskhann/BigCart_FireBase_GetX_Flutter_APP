import 'package:big_cart_app/controller/Cart_Contrller/cart_controller.dart';
import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:big_cart_app/services/Payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  RxBool isLoading = false.obs;

  PaymentServices _paymentServices = PaymentServices();

  String getCardLastFourDigit() {
    if (cardNumberForCard.value.length > 15) {
      String fourdigit =
          cardNumberForCard.value.substring(cardNumberForCard.value.length - 4);
      return "XXXX XXXX XXXX $fourdigit";
    } else {
      return "XXXX XXXX XXXX XXXX";
    }
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

  void updatePaymentMethod(String value) {
    _paymentMethod = value;
    update();
  }

  void navToOrderSuccess() {
    Get.offNamed(RouteName.orderSuccessScreen);
  }

  void processTransaction() async {
    CartController cartController = Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController());
    isLoading(true);
    try {
      final cart = await cartController.getCart();
      final total = await cartController.getSubTotal();
      Map<String, dynamic> orderDetails = {
        'paymentMethod': _paymentMethod,
        'cardNumber': cardNumberForCard.value,
        'cardHolderName': cardHolderNameForCard.value,
        'cardExpiryDate': cardExpiryDateForCard.value,
        'cardCVV': cardCVV.value.text,
        'cart': cart,
        'total': total,
        'orderDate': DateFormat('dd-MM-yyyy').format(DateTime.now()),
        'orderTime': DateFormat('hh:mm a').format(DateTime.now()),
      };
      await _paymentServices.addToTransactionDetails(orderDetails);
      await _paymentServices.addToMyOrders(orderDetails);
      await cartController.clearCart();
      navToOrderSuccess();
    } catch (e) {
      Get.snackbar('Transaction Error',
          'Something went wrong while processing your transaction');
    } finally {
      isLoading(false);
    }
  }
}
