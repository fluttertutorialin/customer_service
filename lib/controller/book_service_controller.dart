import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookServiceController extends GetxController {
  final scheduled = false.obs;

  void toggleScheduled(value) {
    scheduled.value = value;
  }

  TextStyle? getTextTheme(bool selected) {
    if (selected) {
      return Get.textTheme.bodyText2!
          .merge(TextStyle(color: Get.theme.primaryColor));
    }
    return Get.textTheme.bodyText2;
  }

  Color? getColor(bool selected) {
    if (selected) {
      return Get.theme.colorScheme.secondary;
    }
    return null;
  }
}
