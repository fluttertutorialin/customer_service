import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideImageItemWidget extends StatelessWidget {
  final String url;

  const SlideImageItemWidget({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(
              Directionality.of(context) == TextDirection.rtl ? math.pi : 0),
          child: CachedNetworkImage(
              width: double.infinity,
              height: 310,
              fit: BoxFit.cover,
              imageUrl: url,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline))),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 20),
          child: SizedBox(
              width: 180,
              child: Column(
                  children: [
                    Text('Handyman',
                        style: Get.textTheme.headline5!
                            .merge(const TextStyle(color: Colors.black)),
                        maxLines: 3),
                    Text('Assign a Handyman at Work to Fix the Household',
                        style: Get.textTheme.bodyText1!
                            .merge(const TextStyle(color: Colors.black)),
                        maxLines: 3)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch)))
    ]);
  }
}
