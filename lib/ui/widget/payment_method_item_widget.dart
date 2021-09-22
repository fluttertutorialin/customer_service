import '../../controller/controller.dart';
import '../../model/payment_method_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class PaymentMethodItemWidget extends GetWidget<CheckoutController> {
  const PaymentMethodItemWidget({
    Key? key,
    required PaymentMethodResponse paymentMethod,
  })  : _paymentMethod = paymentMethod,
        super(key: key);

  final PaymentMethodResponse _paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration:
              getBoxDecoration(color: controller.getColor(_paymentMethod)),
          child: Theme(
              data: ThemeData(toggleableActiveColor: Get.theme.primaryColor),
              child: RadioListTile(
                  value: _paymentMethod,
                  groupValue: controller.selectedPaymentMethod.value,
                  onChanged: (PaymentMethodResponse? value) {
                    controller.selectPaymentMethod(paymentMethod: value!);
                  },
                  title: Text(_paymentMethod.name!.tr,
                          style: controller.getTitleTheme(_paymentMethod))
                      .paddingOnly(bottom: 5),
                  subtitle: Text(_paymentMethod.description!.tr,
                      style: controller.getSubTitleTheme(_paymentMethod)),
                  secondary: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage(_paymentMethod.logo!),
                              fit: BoxFit.fill))))));
    });
  }
}
