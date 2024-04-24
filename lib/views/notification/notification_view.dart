import 'package:big_cart_app/resources/TextStyle/text_styles.dart';
import 'package:big_cart_app/resources/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification', style: AppTextStyles.appBarStyle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                tileColor: AppColors.white,
                title: Text('Allow Notification',
                    style: AppTextStyles.appBarStyle
                        .copyWith(fontSize: Get.width * 0.04)),
                subtitle: Text('Get notification for new offers and updates',
                    style: AppTextStyles.substitle.copyWith(
                      fontSize: Get.width * 0.03,
                    )),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.allowNotification.value,
                    onChanged: (value) {
                      notificationController.allowNotificationChange(value);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                tileColor: AppColors.white,
                title: Text('Email Notification',
                    style: AppTextStyles.appBarStyle
                        .copyWith(fontSize: Get.width * 0.04)),
                subtitle: Text(
                    'Get notification for new offers and updates on e-mail',
                    style: AppTextStyles.substitle.copyWith(
                      fontSize: Get.width * 0.03,
                    )),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.emailNotification.value,
                    onChanged: (value) {
                      notificationController.emailNotificationChange(value);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                tileColor: AppColors.white,
                title: Text('Order Notification',
                    style: AppTextStyles.appBarStyle
                        .copyWith(fontSize: Get.width * 0.04)),
                subtitle:
                    Text('Get notification for new offers and updates on order',
                        style: AppTextStyles.substitle.copyWith(
                          fontSize: Get.width * 0.03,
                        )),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.orderNotification.value,
                    onChanged: (value) {
                      notificationController.orderNotificationChange(value);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                )),
          ),
          //General Notifcation
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                tileColor: AppColors.white,
                title: Text('General Notification',
                    style: AppTextStyles.appBarStyle
                        .copyWith(fontSize: Get.width * 0.04)),
                subtitle: Text(
                    'Get notification for new offers and updates on general',
                    style: AppTextStyles.substitle.copyWith(
                      fontSize: Get.width * 0.03,
                    )),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.generalNotification.value,
                    onChanged: (value) {
                      notificationController.generalNotificationChange(value);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                )),
          ),
        ],
      ),
      backgroundColor: AppColors.greyBackGround,
    );
  }
}

class NotificationController extends GetxController {
  RxBool allowNotification = false.obs;
  RxBool emailNotification = false.obs;
  RxBool orderNotification = false.obs;
  RxBool generalNotification = false.obs;

  void allowNotificationChange(bool value) {
    allowNotification.value = value;
    if (!value) {
      emailNotification.value = false;
      orderNotification.value = false;
      generalNotification.value = false;
    }
  }

  void emailNotificationChange(bool value) {
    if (!allowNotification.value) {
      Get.snackbar('Error', 'Notification is not allowed');
      return;
    }
    emailNotification.value = value;
  }

  void orderNotificationChange(bool value) {
    if (!allowNotification.value) {
      Get.snackbar('Error', 'Notification is not allowed');
      return;
    }
    orderNotification.value = value;
  }

  void generalNotificationChange(bool value) {
    if (!allowNotification.value) {
      Get.snackbar('Error', 'Notification is not allowed');
      return;
    }
    generalNotification.value = value;
  }
}
