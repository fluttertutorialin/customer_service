import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationBorderContainer extends StatefulWidget {
  const AnimationBorderContainer({Key? key}) : super(key: key);

  @override
  createState() => AnimationBorder();
}

class AnimationBorder extends State<AnimationBorderContainer>
    with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController controller;
  late Animation<EdgeInsetsGeometry> marginAnim;
  late Animation<BorderRadius?> radiusAnim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    marginAnim = Tween(
      begin: const EdgeInsets.symmetric(horizontal: 16),
      end: EdgeInsets.zero,
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
      begin: BorderRadius.circular(16),
      end: BorderRadius.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
              margin: marginAnim.value,
              child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: radiusAnim.value ?? BorderRadius.zero),
                  color: Colors.cyan.shade700,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: Column(children: <Widget>[
                        SizedBox(
                            width: double.infinity,
                            height: 80,
                            child: Row(children: <Widget>[
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Text('Notification title',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: Get.textTheme.bodyText1!.merge(
                                          const TextStyle(
                                              fontWeight: FontWeight.w600)))),
                              const SizedBox(width: 8)
                            ])),
                        ClipRect(
                            child: Align(
                                heightFactor: controller.value, child: child))
                      ]))));
        },
        child: isExpanded || controller.isDismissed
            ? Column(children: const [Text('ddd')])
            : null);
  }

  void onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}
