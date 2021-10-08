import '../widget/category_list_item_widget.dart';
import '../widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('category'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()})),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(primary: true, children: [
              const SearchBarWidget(),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(children: [
                    Expanded(
                        child: Text('categoryOfServices'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline5)),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.format_list_bulleted,
                              color: Get.theme
                                  .focusColor // Get.theme.colorScheme.secondary
                              )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.apps,
                              color: Get.theme.colorScheme
                                  .secondary //Get.theme.focusColor
                              ))
                    ])
                  ])),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return const CategoryListItemWidget();
                  })
            ])));
  }
}
