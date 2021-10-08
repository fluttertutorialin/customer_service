import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';
import '../../controller/controller.dart';
import '../widget/block_button_widget.dart';
import '../../navigation/route_name.dart';

class BookServicePage extends GetView<BookServiceController> {
  const BookServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('bookTheService'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => Get.back()),
            elevation: 0),
        bottomNavigationBar: _buildBlockButtonWidget(),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: getBoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('yourAddress'.tr, style: Get.textTheme.caption),
                    const SizedBox(height: 8),
                    Text('29 Street of NY, New York City, USA',
                        style: Get.textTheme.bodyText2)
                  ])),
          const SizedBox(height: 20),
          Obx(() {
            return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: getBoxDecoration(
                    color: controller.getColor(!controller.scheduled.value)),
                child: Theme(
                    data: ThemeData(
                        toggleableActiveColor: Get.theme.primaryColor),
                    child: RadioListTile(
                        value: false,
                        groupValue: controller.scheduled.value,
                        onChanged: (value) {
                          controller.toggleScheduled(value);
                        },
                        title: Text('asSoonAsPossible'.tr,
                                style: controller
                                    .getTextTheme(!controller.scheduled.value))
                            .paddingSymmetric(vertical: 20))));
          }),
          Obx(() {
            return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: getBoxDecoration(
                    color: controller.getColor(controller.scheduled.value)),
                child: Theme(
                    data: ThemeData(
                      toggleableActiveColor: Get.theme.primaryColor,
                    ),
                    child: RadioListTile(
                        value: true,
                        groupValue: controller.scheduled.value,
                        onChanged: (value) {
                          controller.toggleScheduled(value);
                        },
                        title: Text('scheduleAnOrder'.tr,
                                style: controller
                                    .getTextTheme(controller.scheduled.value))
                            .paddingSymmetric(vertical: 20))));
          }),
          Obx(() {
            return AnimatedOpacity(
                opacity: controller.scheduled.value ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: controller.scheduled.value ? 20 : 0),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: controller.scheduled.value ? 20 : 0),
                    decoration: getBoxDecoration(),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Text(
                                'When would you like us to come to your address?',
                                style: Get.textTheme.bodyText1)),
                        const SizedBox(width: 10),
                        MaterialButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: const StadiumBorder(),
                            color: Get.theme.colorScheme.secondary
                                .withOpacity(0.2),
                            child: Text('selectADate'.tr,
                                style: Get.textTheme.subtitle1))
                      ]),
                      const Divider(thickness: 1.3, height: 30),
                      Row(children: [
                        Expanded(
                            child: Text(
                                "At What's time you are free in your address?",
                                style: Get.textTheme.bodyText1)),
                        const SizedBox(width: 10),
                        MaterialButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: const StadiumBorder(),
                            color: Get.theme.colorScheme.secondary
                                .withOpacity(0.2),
                            child: Text('selectATime'.tr,
                                style: Get.textTheme.subtitle1))
                      ])
                    ])));
          }),
          Obx(() {
            return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                    0, controller.scheduled.value ? 0 : -110, 0),
                child: Column(children: [
                  Text('requestedServiceOn'.tr).paddingSymmetric(vertical: 20),
                  Text('Friday, September 22, 2021',
                      style: Get.textTheme.headline5),
                  Text('At 11:23', style: Get.textTheme.headline3)
                ]));
          })
        ])));
  }

  _buildBlockButtonWidget() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Get.theme.focusColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5))
            ]),
        child: BlockButtonWidget(
            text: Stack(alignment: AlignmentDirectional.centerEnd, children: [
              SizedBox(
                  width: double.infinity,
                  child: Text('continue'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline6!
                          .merge(TextStyle(color: Get.theme.primaryColor)))),
              Icon(Icons.arrow_forward_ios,
                  color: Get.theme.primaryColor, size: 20)
            ]),
            color: Get.theme.colorScheme.secondary,
            onPressed: () {
              Get.toNamed(RouteName.checkoutRoute);
            }).paddingOnly(right: 20, left: 20));
  }
}
