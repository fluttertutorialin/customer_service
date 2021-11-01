import 'package:flutter/material.dart';

/*
AnimatedDialog(builder: (controller) {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeUtil.sWidth * .07, vertical: topImageSize / 2),
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(defPuzzleRadius)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: (topImageSize / 2) + 30,
                ),
                Text(
                  'Do you want to delete \nthis Image?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: (topImageSize / 2) + 25,
                ),
                Row(
                  children: [
                    Expanded(
                        child: PuzzleButton.left(
                      title: 'CANCEL',
                      enabled: true,
                      onPressed: () {
                        controller
                            .reverse()
                            .whenComplete(() => onCancel.call());
                      },
                    )),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: PuzzleButton.right(
                      title: 'DELETE',
                      enabled: true,
                      onPressed: () {
                        controller
                            .reverse()
                            .whenComplete(() => onDelete.call());
                      },
                    )),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Material(
              shape: CircleBorder(),
              color: background,
              child: Container(
                height: topImageSize,
                width: topImageSize,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: assetProvider(assetOrFile))),
              ),
            ),
          )
        ],
      );
    })
*/

class AnimatedDialog extends StatefulWidget {
  final Widget Function(AnimationController) builder;

  const AnimatedDialog({Key? key, required this.builder}) : super(key: key);

  @override
  createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticInOut,
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return ScaleTransition(
        scale: _scaleAnimation, child: widget.builder(_animationController));
  }
}
