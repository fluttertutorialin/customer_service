import '../../controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_completed_page.dart';
import 'order_on_going_page.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                title: Text('myBookings'.tr,
                    style: Get.textTheme.headline6!
                        .merge(const TextStyle(fontSize: 18))),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon: Icon(Icons.sort, color: context.theme.hintColor),
                    onPressed: () => {Scaffold.of(context).openDrawer()}),
                bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    unselectedLabelColor: context.theme.colorScheme.secondary,
                    labelColor: context.theme.primaryColor,
                    labelStyle: context.textTheme.bodyText1,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.theme.colorScheme.secondary),
                    tabs: [
                      Tab(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: context.theme.colorScheme.secondary
                                      .withOpacity(0.2)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Ongoing'.tr,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade)))),
                      Tab(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: context.theme.colorScheme.secondary
                                      .withOpacity(0.2)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Completed'.tr,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade)))),
                      Tab(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: context.theme.colorScheme.secondary
                                      .withOpacity(0.2)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Archived'.tr,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade))))
                    ],
                    onTap: (index) async {
                      switch (index) {
                        case 0:
                          await controller.getOngoingTasks();
                          break;
                        case 1:
                          await controller.getCompletedTasks();
                          break;
                        case 2:
                          await controller.getArchivedTasks();
                      }
                    })),
            body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBarView(children: [
                  RefreshIndicator(
                      onRefresh: () async {},
                      child: const SingleChildScrollView(
                          child: OrderOnGoingPage())),
                  RefreshIndicator(
                      onRefresh: () async {},
                      child: const OrderCompletedPage()),
                  RefreshIndicator(
                      onRefresh: () async {}, child: const OrderCompletedPage())
                ]))));
  }
}
