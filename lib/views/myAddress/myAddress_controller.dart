import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddressController extends GetxController {
  RxBool isAdressExpanded = false.obs;
  final nameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final zipController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final nameFocusNode = FocusNode().obs;
  final addressFocusNode = FocusNode().obs;
  final cityFocusNode = FocusNode().obs;
  final countryFocusNode = FocusNode().obs;
  final zipFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;

  void toggleAddress() {
    isAdressExpanded.value = !isAdressExpanded.value;
  }
}
