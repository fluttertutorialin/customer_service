import '../model/payment_method_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  late List<PaymentMethodResponse> paymentsList;
  late List<PaymentMethodResponse> cashList;
  late List<PaymentMethodResponse> walletList;
  Rx<PaymentMethodResponse> selectedPaymentMethod =
      PaymentMethodResponse('id', 'name', 'description', 'route', 'logo').obs;

  @override
  void onInit() async {
    await loadPaymentMethodsList();
    selectedPaymentMethod.value =
        paymentsList.firstWhere((element) => element.isDefault!);
    super.onInit();
  }

  Future loadPaymentMethodsList() async {
    paymentsList = [
      PaymentMethodResponse('visa_card', 'visaCard', 'clickPayWithVisaCard',
          '/Checkout', 'assets/img/visacard.png',
          isDefault: true),
      PaymentMethodResponse('mastercard', 'masterCard',
          'clickPayWithMastercard', '/Checkout', 'assets/img/mastercard.png'),
      PaymentMethodResponse('razorpay', 'razorpay', 'clickPayRazorpay',
          '/RazorPay', 'assets/img/razorpay.png'),
      PaymentMethodResponse('paypal', 'paypal', 'clickPayPayPal', '/PayPal',
          'assets/img/paypal.png'),
    ];
    cashList = [
      PaymentMethodResponse(
          'cod', 'cash', 'clickPayCash', '/Cash', 'assets/img/cash.png'),
    ];
    walletList = [
      PaymentMethodResponse(
          'wallet', 'wallet', 'payWallet', '/Wallet', 'assets/img/wallet.png'),
    ];
  }

  void selectPaymentMethod({PaymentMethodResponse? paymentMethod}) {
    selectedPaymentMethod.value = paymentMethod!;
  }

  TextStyle? getTitleTheme(PaymentMethodResponse paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.textTheme.bodyText2!
          .merge(TextStyle(color: Get.theme.primaryColor));
    }
    return Get.textTheme.bodyText2;
  }

  TextStyle? getSubTitleTheme(PaymentMethodResponse paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.textTheme.caption!
          .merge(TextStyle(color: Get.theme.primaryColor));
    }
    return Get.textTheme.caption;
  }

  Color? getColor(PaymentMethodResponse paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.theme.colorScheme.secondary;
    }
    return null;
  }
}
