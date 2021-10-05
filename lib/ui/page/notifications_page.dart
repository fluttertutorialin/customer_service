import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/notification_widget.dart';
import '../../model/notification_admin.dart';
import '../widget/builder/custom_list_view_builder.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('notification'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()})),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(primary: true, children: <Widget>[
              Text('Incoming Notification'.tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text('swipeDeleteLeft'.tr, style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              notificationsList()
            ])));
  }

  Widget notificationsList() {
    List<NotificationAdmin> notificationList = [
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
      NotificationAdmin(
          title: 'Notification title',
          notificationSentTime: '26, February 2021 | 04::34'),
    ];
    return CustomListViewBuilder<NotificationAdmin>(
        items: notificationList,
        itemBuilder: (context, notificationAdmin, i) {
          return const NotificationWidget();
        });
  }
}
