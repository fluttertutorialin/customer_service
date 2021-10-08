import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class CategoryListItemWidget extends StatelessWidget {
  final bool? expanded;

  const CategoryListItemWidget({Key? key, this.expanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: getBoxDecoration(
            border: const Border.fromBorderSide(BorderSide.none),
            gradient: LinearGradient(
                colors: [
                  const Color(0xff0abde3).withOpacity(0.6),
                  const Color(0xff0abde3).withOpacity(0.1)
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.topEnd,
                stops: const [0.0, 0.5],
                tileMode: TileMode.clamp)),
        child: Theme(
            data: Get.theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
                initiallyExpanded: expanded!,
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                title: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.08),
                    onTap: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: 60,
                              height: 60,
                              child: SvgPicture.network(
                                  'http://handyman.smartersvision.com/mock/categories/media/car.svg',
                                  color: const Color(0xff0abde3),
                                  height: 100)),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text('Name',
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Get.textTheme.bodyText2))
                        ])),
                children: List.generate(0, (index) {
                  return GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 16),
                          child: Text('Name', style: Get.textTheme.bodyText1),
                          decoration: BoxDecoration(
                              color: Get.theme.scaffoldBackgroundColor
                                  .withOpacity(0.2),
                              border: Border(
                                  top: BorderSide(
                                      color: Get.theme.scaffoldBackgroundColor
                                          .withOpacity(0.3))))));
                }))));
  }
}
