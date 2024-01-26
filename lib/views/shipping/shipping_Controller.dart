import 'package:big_cart_app/resources/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController {
  RxInt selectedShippingMethod = 0.obs;
  final nameController = TextEditingController().obs;
  final nameFocusNode = FocusNode().obs;
  final emailController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final phoneController = TextEditingController().obs;
  final phoneFocusNode = FocusNode().obs;
  final addressController = TextEditingController().obs;
  final addressFocusNode = FocusNode().obs;
  final cityController = TextEditingController().obs;
  final cityFocusNode = FocusNode().obs;
  final zipCodeController = TextEditingController().obs;
  final zipCodeFocusNode = FocusNode().obs;
  RxBool isSaveAddress = false.obs;

  void standardDelivery() {
    selectedShippingMethod.value = 1;
  }

  void nextDayDelivery() {
    selectedShippingMethod.value = 2;
  }

  void nintyMinutesDelivery() {
    selectedShippingMethod.value = 3;
  }

  bool nextButtonPressed() {
    if (selectedShippingMethod.value == 0) {
      return false;
    } else {
      Get.offNamed(RouteName.shippingInfoScreen);
      return true;
    }
  }

  bool validate() {
    if (nameController.value.text.isEmpty) {
      return false;
    }
    if (emailController.value.text.isEmpty) {
      return false;
    }
    if (phoneController.value.text.isEmpty) {
      return false;
    }
    if (addressController.value.text.isEmpty) {
      return false;
    }
    if (cityController.value.text.isEmpty) {
      return false;
    }
    if (zipCodeController.value.text.isEmpty) {
      return false;
    }
    return true;
  }
}
