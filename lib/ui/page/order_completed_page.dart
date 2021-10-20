import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        primary: true,
        shrinkWrap: false,
        itemCount: 20,
        itemBuilder: ((_, index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: getBoxDecoration(),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        imageUrl: 'http://lorempixel.com/200/200/business/5/',
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline))),
                const SizedBox(width: 20),
                Expanded(
                    child: Wrap(
                        runSpacing: 10,
                        alignment: WrapAlignment.end,
                        children: <Widget>[
                      Row(children: [
                        Text('Title',
                            style: context.textTheme.bodyText2, maxLines: 3)
                      ]),
                      const Divider(height: 8, thickness: 1),
                      Row(children: [
                        Expanded(
                            flex: 1,
                            child: Text('yourReview'.tr,
                                style: context.textTheme.bodyText1)),
                        Wrap(spacing: 0, children: getStarsList(0.0))
                      ]),
                      Row(children: [
                        Expanded(
                            child: Text('time'.tr,
                                style: context.textTheme.bodyText1)),
                        Text('13:31 | 2020-11-05',
                            style: context.textTheme.caption)
                      ]),
                      Row(children: [
                        Expanded(
                            child: Text('totalPrice'.tr,
                                style: context.textTheme.bodyText1)),
                        getPrice(100.00, style: context.textTheme.headline6)
                      ]),
                      Wrap(spacing: 10, children: [
                        MaterialButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: const StadiumBorder(),
                            color: context.theme.colorScheme.secondary
                                .withOpacity(0.1),
                            child: Text('rating'.tr,
                                style: context.textTheme.subtitle1)),
                        MaterialButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: const StadiumBorder(),
                            color: context.theme.colorScheme.secondary
                                .withOpacity(0.1),
                            child: Text('reBooking'.tr,
                                style: context.textTheme.subtitle1))
                      ])
                    ]))
              ]));
        }));
  }
}
