import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page.dart';
import '../widget/drawer_widget.dart';
import '../../controller/controller.dart';

class MainTabPage extends GetView<MainTabController> {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(child: DrawerWidget(), elevation: 0),
        body: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: const [
                  HomePage(),
                  OrderPage(),
                  ChatPage(),
                  AccountPage()
                ])),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined, size: 24),
                      label: 'home'.tr),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.update, size: 24),
                      label: 'booking'.tr),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.chat_bubble_outline, size: 24),
                      label: 'chat'.tr),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outline, size: 24),
                      label: 'profile'.tr)
                ],
                backgroundColor: context.theme.scaffoldBackgroundColor,
                currentIndex: controller.tabIndex.value,
                selectedItemColor: context.theme.colorScheme.secondary,
                onTap: (index) => controller.changeTabIndex(index),
                type: BottomNavigationBarType.fixed)));
  }
}
