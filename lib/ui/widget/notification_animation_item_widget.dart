import 'package:flutter/material.dart';
import 'animation_border_container.dart';
import 'notification_widget.dart';

class NotificationAnimationItemWidget extends StatefulWidget {
  final AnimationController animationController;
  final Animation<double> animation;

  const NotificationAnimationItemWidget(
      {Key? key, required this.animationController, required this.animation})
      : super(key: key);

  @override
  createState() => _NotificationAnimation();
}

class _NotificationAnimation extends State<NotificationAnimationItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: widget.animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      100 * (1.0 - widget.animation.value), 0.0, 0.0),
                  child: const NotificationWidget()));
        });
  }
}
