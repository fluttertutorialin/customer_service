import 'package:cached_network_image/cached_network_image.dart';
import '../../navigation/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class RecommendedCarouselWidget extends StatelessWidget {
  const RecommendedCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 345,
        child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            primary: false,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                      width: 160,
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
                                color: Get.theme.focusColor.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(children: [
                        Hero(
                            tag: index,
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: CachedNetworkImage(
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    imageUrl: '',
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error_outline)))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            height: 115,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Service title',
                                      maxLines: 2,
                                      style: Get.textTheme.bodyText2!.merge(
                                          TextStyle(
                                              color: Get.theme.hintColor))),
                                  Wrap(children: getStarsList(5.0)),
                                  const SizedBox(height: 10),
                                  Wrap(children: [
                                    Text('\$' '17.5',
                                        style: Get.textTheme.bodyText1),
                                    const Text(' - '),
                                    Text('\$' '35.15',
                                        style: Get.textTheme.bodyText1),
                                  ])
                                ]))
                      ])));
            }));
  }
}
