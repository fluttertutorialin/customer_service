import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/categories_carousel_widget.dart';
import '../widget/location_widget.dart';
import '../widget/recommended_carousel_widget.dart';
import '../widget/search_bar_widget.dart';
import '../widget/slide_image_item_widget.dart';
import '../../service/settings_service.dart';
import '../../controller/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(primary: true, shrinkWrap: false, slivers: <
                Widget>[
              SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 280,
                  elevation: 0.0,
                  pinned: true,
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  title: Text(
                      Get.find<SettingsService>().setting.value.appName!,
                      style: Get.textTheme.headline6!.merge(const TextStyle(
                          fontSize: 18))),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.sort, color: Get.theme.hintColor),
                      onPressed: () => {Scaffold.of(context).openDrawer()}),
                  bottom: const SearchBarWidget(),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            CarouselSlider(
                                options: CarouselOptions(
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 7),
                                    height: 310,
                                    viewportFraction: 1.0,
                                    onPageChanged: (index, reason) {}),
                                items: [
                                  'http://handyman.smartersvision.com/mock/slides/media/slide0001.jpg',
                                  'http://handyman.smartersvision.com/mock/slides/media/slide0001.jpg',
                                  'http://handyman.smartersvision.com/mock/slides/media/slide0001.jpg',
                                  'http://handyman.smartersvision.com/mock/slides/media/slide0001.jpg'
                                ].map((String url) {
                                  return SlideImageItemWidget(url: url);
                                }).toList()),
                          ])).marginOnly(bottom: 42)),
              SliverToBoxAdapter(
                  child: Wrap(children: [
                const LocationWidget(),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(children: [
                      Expanded(
                          child: Text('category'.tr,
                              style: Get.textTheme.headline5)),
                      MaterialButton(
                          elevation: 0,
                          onPressed: () {},
                          shape: const StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.1),
                          child: Text('viewAll'.tr,
                              style: Get.textTheme.subtitle1))
                    ])),
                const CategoriesCarouselWidget(),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(children: [
                      Expanded(
                          child: Text('recommendedForYou'.tr,
                              style: Get.textTheme.headline5)),
                      MaterialButton(
                          elevation: 0,
                          onPressed: () {},
                          shape: const StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.1),
                          child: Text('viewAll'.tr,
                              style: Get.textTheme.subtitle1))
                    ])),
                 RecommendedCarouselWidget(),
              ])),
            ])));
  }
}
