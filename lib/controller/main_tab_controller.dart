import '../navigation/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTabController extends GetxController {
  RxInt tabIndex = RxInt(0);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void changePageOutRoot(int _index) {
    tabIndex.value = _index;
    Get.offNamedUntil(RouteName.mainTabRoute, (Route route) {
      if (route.settings.name == RouteName.mainTabRoute) {
        return true;
      }
      return false;
    }, arguments: _index);
  }
}
