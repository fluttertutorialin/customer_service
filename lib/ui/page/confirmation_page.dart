import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/block_button_widget.dart';
import '../../controller/controller.dart';

class ConfirmationPage extends GetView<MainTabController> {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('confirmation'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.sort, color: Get.theme.hintColor),
                onPressed: () => {Scaffold.of(context).openDrawer()}),
            elevation: 0),
        body: Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.green.withOpacity(1),
                                  Colors.green.withOpacity(0.2)
                                ])),
                        child: Icon(Icons.check,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 90)),
                    Positioned(
                        right: -30,
                        bottom: -50,
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(150)))),
                    Positioned(
                        left: -20,
                        top: -50,
                        child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(150))))
                  ]),
                  const SizedBox(height: 40),
                  Text('thankYou!'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline3),
                  const SizedBox(height: 10),
                  Opacity(
                      opacity: 0.3,
                      child: Text('successfulReceiveConfirmationSoon'.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.headline4))
                ])),
        bottomNavigationBar: _buildBlockButtonWidget());
  }

  _buildBlockButtonWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Get.theme.focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5)),
          ]),
      child: BlockButtonWidget(
          text: Stack(alignment: AlignmentDirectional.centerEnd, children: [
            SizedBox(
                width: double.infinity,
                child: Text('myBookings'.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline6!
                        .merge(TextStyle(color: Get.theme.primaryColor)))),
            Icon(Icons.arrow_forward_ios,
                color: Get.theme.primaryColor, size: 20)
          ]),
          color: Get.theme.colorScheme.secondary,
          onPressed: () {
            controller.changePageOutRoot(1);
          }).paddingOnly(bottom: 20, right: 20, left: 20),
    );
  }
}
