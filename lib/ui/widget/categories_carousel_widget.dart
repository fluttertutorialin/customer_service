import 'package:cached_network_image/cached_network_image.dart';
import '../../navigation/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesCarouselWidget extends StatelessWidget {
  const CategoriesCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        margin: const EdgeInsets.only(bottom: 15),
        child: ListView.builder(
            primary: false,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.myServiceRoute);
                  },
                  child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsetsDirectional.only(
                          end: 20, start: index == 0 ? 20 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xff0abde3).withOpacity(1),
                                const Color(0xff0abde3).withOpacity(0.1)
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              stops: const [0.1, 0.9],
                              tileMode: TileMode.clamp),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 30, top: 30),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: ('http://handyman.smartersvision.com/mock/categories/media/car.svg'
                                            .toLowerCase()
                                            .endsWith('.svg')
                                        ? SvgPicture.network(
                                            'http://handyman.smartersvision.com/mock/categories/media/car.svg',
                                            color: const Color(0xff0abde3))
                                        : CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: '',
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Icon(Icons.error_outline))))),
                            Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10, top: 0),
                                child: Text('Name',
                                    maxLines: 2,
                                    style: Get.textTheme.bodyText2!.merge(
                                        TextStyle(
                                            color: Get.theme.primaryColor))))
                          ])));
            }));
  }
}
