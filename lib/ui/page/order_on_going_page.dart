import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';
import '../widget/on_going_widget.dart';

class OrderOnGoingPage extends StatelessWidget {
  const OrderOnGoingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 230,
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              primary: false,
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 200,
                        margin: EdgeInsetsDirectional.only(
                            end: 20,
                            start: index == 0 ? 20 : 0,
                            top: 20,
                            bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      context.theme.focusColor.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5))
                            ]),
                        child: Column(
                            //alignment: AlignmentDirectional.topStart,
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: CachedNetworkImage(
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'http://lorempixel.com/200/200/business/5/',
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error_outline))),
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: context.theme.primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: Wrap(
                                      direction: Axis.vertical,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      runAlignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: context.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color:
                                                      context.theme.hintColor)),
                                        ),
                                        const SizedBox(height: 5),
                                        Text('November 5, 2020',
                                            style: context.textTheme.caption!
                                                .merge(TextStyle(
                                                    color: context
                                                        .theme.focusColor))),
                                        Text('At 13:31',
                                            style: context.textTheme.caption!
                                                .merge(TextStyle(
                                                    color: context
                                                        .theme.focusColor)))
                                      ]))
                            ])));
              })),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: context.theme.focusColor.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [
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
                  child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                Text('Service name',
                    style: context.textTheme.bodyText2, maxLines: 3),
                Container(
                    padding: const EdgeInsets.only(
                        right: 12, left: 12, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: context.theme.focusColor.withOpacity(0.1)),
                    child: Text('completed'.tr,
                        style: TextStyle(color: context.theme.hintColor)))
              ]))
            ]),
            const Divider(thickness: 1, height: 40),
            OnGoingWidget(
                description: 'Time'.tr,
                child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: const [
                      Text('November 5, 2020'),
                      Text('At 13:31')
                    ]),
                hasDivider: true),
            OnGoingWidget(
                description: 'Payment Method'.tr,
                value: 'Paypal',
                hasDivider: true),
            OnGoingWidget(
                description: 'Tax Amount'.tr,
                child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        getPrice(18.46, style: context.textTheme.bodyText2))),
            OnGoingWidget(
                description: 'Total Amount'.tr,
                child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        getPrice(145.46, style: context.textTheme.headline6)),
                hasDivider: true),
            OnGoingWidget(
                description: 'Address'.tr,
                value: '626 Meadow Street, Eagletown, Michigan, 3705',
                hasDivider: true),
            OnGoingWidget(description: 'Description'.tr, value: 'Description')
          ]))
    ]);
  }
}
