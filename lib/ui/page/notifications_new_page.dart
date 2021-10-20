import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widget/max_width_raised_button.dart';
import '../widget/notification_widget.dart';

class NotificationNewPage extends StatefulWidget {
  const NotificationNewPage({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _NotificationNewState();
}

class _NotificationNewState extends State<NotificationNewPage>
    with TickerProviderStateMixin {
  final List<String> _tabs = ['Today', 'Past'];

  late ScrollController _scrollController;
  late AnimationController _textAnimationController;
  late Animation<Offset> _transTween;
  late Animation<double> _opacityTween;

  @override
  void initState() {
    super.initState();

    _textAnimationController =
        AnimationController(vsync: this, duration: Duration.zero);

    _transTween = Tween(begin: const Offset(0, 24), end: Offset.zero)
        .animate(_textAnimationController);

    _opacityTween = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_textAnimationController);

    _scrollController = ScrollController()
      ..addListener(() {
        _textAnimationController
            .animateTo((_scrollController.offset - 200) / 100);
      });
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [_buildSliverAppBar(context, innerBoxIsScrolled)];
                },
                body: _buildTabBarView())));
  }

  Widget _buildSliverAppBar(
    BuildContext context,
    bool innerBoxIsScrolled,
  ) {
    return AnimatedBuilder(
        animation: _textAnimationController,
        builder: (context, child) => SliverAppBar(
            forceElevated: innerBoxIsScrolled,
            leading: IconButton(
                icon:
                    Icon(Icons.arrow_back_ios, color: context.theme.hintColor),
                onPressed: () => Get.back()),
            title: Transform.translate(
                offset: _transTween.value,
                child: Opacity(opacity: _opacityTween.value, child: child)),
            backgroundColor: Get.theme.primaryColor,
            // floating: false,
            pinned: true,
            // snap: false,
            stretch: true,
            expandedHeight: Get.height / 2,
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Container(
                    color: Get.theme.primaryColor,
                    child: TabBar(
                        indicatorColor: context.theme.colorScheme.secondary,
                        labelColor: Get.theme.hintColor,
                        tabs: _tabs.map((e) => Tab(text: e)).toList()))),
            flexibleSpace: _buildFlexibleSpaceBarWidget()),
        child: Text('notification'.tr,
            style:
                Get.textTheme.headline6!.merge(const TextStyle(fontSize: 18))));
  }

  Widget _buildFlexibleSpaceBarWidget() {
    final size = MediaQuery.of(context).size;

    return FlexibleSpaceBar(
        background: Stack(fit: StackFit.passthrough, children: [
      CachedNetworkImage(
        imageUrl:
            'http://handyman.smartersvision.com/mock/slides/media/slide0001.jpg',
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
      Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.0, -0.75),
                  end: Alignment(0.0, 0.75),
                  colors: [Colors.transparent, Color(0xff121212)]))),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification Counter',
                    style: Get.textTheme.headline6!
                        .merge(TextStyle(color: Get.theme.primaryColor)),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Main Muscle Group
                      SizedBox(
                          width: size.width / 4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Sent',
                                    style: Get.textTheme.bodyText1!.merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w600))),
                                const SizedBox(height: 8),
                                Text('00',
                                    style: Get.textTheme.bodyText2!.merge(
                                        TextStyle(color: Get.theme.hintColor)))
                              ])),
                      Container(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                          height: 56,
                          margin: const EdgeInsets.symmetric(horizontal: 8)),

                      // Equipment Required
                      SizedBox(
                          width: size.width / 4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Today',
                                    style: Get.textTheme.bodyText1!.merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w600))),
                                const SizedBox(height: 8),
                                Text('00',
                                    style: Get.textTheme.bodyText2!.merge(
                                        TextStyle(color: Get.theme.hintColor)))
                              ])),
                      Container(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                          height: 56,
                          margin: const EdgeInsets.symmetric(horizontal: 8)),
                      // Experience Level
                      SizedBox(
                          width: size.width / 4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Past',
                                    style: Get.textTheme.bodyText1!.merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w600))),
                                const SizedBox(height: 8),
                                Text('00',
                                    style: Get.textTheme.bodyText2!.merge(
                                        TextStyle(color: Get.theme.hintColor)))
                              ]))
                    ]),
                const SizedBox(height: 24),
                MaxWidthRaisedButton(
                    width: double.infinity,
                    color: Get.theme.colorScheme.primary,
                    icon: Icon(Icons.add_rounded,
                        color: Get.theme.primaryColor, size: 20),
                    buttonText: 'ADD NOTIFICATION',
                    onPressed: () {}),
                const SizedBox(height: 48)
              ]))
    ]));
  }

  _buildTabBarView() {
    return TabBarView(children: [
      ListView(
          padding: EdgeInsets.zero, children: const [NotificationWidget()]),
      ListView(padding: EdgeInsets.zero, children: const [NotificationWidget()])
    ]);
  }
}
