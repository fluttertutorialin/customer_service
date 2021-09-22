import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    imageUrl: '',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline))),
  /*          Container(
                width: 80,
                child: Text("Available".tr,
                    maxLines: 1,
                    style: Get.textTheme.bodyText2!.merge(const TextStyle(
                        color: Colors.green, height: 1.4, fontSize: 10)),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 6)),*/
            Container(
                width: 80,
                child: Text('Offline'.tr,
                    maxLines: 1,
                    style: Get.textTheme.bodyText2!.merge(const TextStyle(
                        color: Colors.grey, height: 1.4, fontSize: 10)),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6))
          ]),
          const SizedBox(width: 12),
          Expanded(
              child: Wrap(
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                Row(children: [
                  Text('Service name', style: Get.textTheme.bodyText2, maxLines: 3)
                ]),
                const Divider(height: 8, thickness: 1),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('servicePayment'.tr),
                      getPrice(100, style: Get.textTheme.subtitle2)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('taxAmount'.tr),
                      getPrice(80, style: Get.textTheme.subtitle2)
                    ]),
                const Divider(height: 8, thickness: 1),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('totalAmount'.tr),
                      getPrice(00, style: Get.textTheme.headline6)
                    ])
              ]))
        ]));
  }
}
