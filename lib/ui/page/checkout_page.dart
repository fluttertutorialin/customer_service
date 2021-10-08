import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigation/route_name.dart';
import '../widget/payment_details_widget.dart';
import '../widget/payment_method_item_widget.dart';
import '../../controller/controller.dart';
import '../widget/block_button_widget.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('checkout'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => Get.back()),
            elevation: 0),
        body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              if (controller.paymentsList.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        leading:
                            Icon(Icons.payment, color: Get.theme.hintColor),
                        title: Text('PaymentOption'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headline5),
                        subtitle: Text('selectPreferredPaymentMode'.tr,
                            style: Get.textTheme.caption))),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.paymentsList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    var _paymentMethod =
                        controller.paymentsList.elementAt(index);
                    return PaymentMethodItemWidget(
                        paymentMethod: _paymentMethod);
                  }),
              if (controller.cashList.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        leading: Icon(
                          Icons.monetization_on_outlined,
                          color: Get.theme.hintColor,
                        ),
                        title: Text('cashMethod'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headline5),
                        subtitle: Text('selectPreferredCash'.tr,
                            style: Get.textTheme.caption))),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.cashList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    var _paymentMethod = controller.cashList.elementAt(index);
                    return PaymentMethodItemWidget(
                        paymentMethod: _paymentMethod);
                  }),
              if (controller.walletList.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        leading: Icon(Icons.account_balance_wallet_outlined,
                            color: Get.theme.hintColor),
                        title: Text('walletMethod'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headline5),
                        subtitle: Text('selectPreferredWallet'.tr,
                            style: Get.textTheme.caption))),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.walletList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    var _paymentMethod = controller.walletList.elementAt(index);
                    return PaymentMethodItemWidget(
                        paymentMethod: _paymentMethod);
                  })
            ]),
        bottomNavigationBar: buildBottomWidget());
  }

  Widget buildBottomWidget() {
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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const PaymentDetailsWidget(),
          BlockButtonWidget(
              text: Stack(alignment: AlignmentDirectional.centerEnd, children: [
                SizedBox(
                    width: double.infinity,
                    child: Text('hireAndPayNow'.tr,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6!
                            .merge(TextStyle(color: Get.theme.primaryColor)))),
                Icon(Icons.arrow_forward_ios,
                    color: Get.theme.primaryColor, size: 20)
              ]),
              color: Get.theme.colorScheme.secondary,
              onPressed: () {
                Get.toNamed(RouteName.confirmationRoute);
              }).paddingSymmetric(vertical: 10, horizontal: 20)
        ]));
  }
}
