import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckboxListView extends StatelessWidget {
  final List<dynamic> items;
  final bool Function(dynamic) checked;
  final void Function(bool? value, dynamic item) onChangedMainMuscleEnum;
  final String Function(dynamic) getTitle;
  final Offset? beginOffset;
  final Offset? endOffset;
  final double? offsetStartInterval;
  final double? offsetDelay;
  final double? offsetDuration;
  final Curve? offsetCurves;
  final double? opacityStartInterval;
  final double? opacityDelay;
  final double? opacityDuration;
  final Curve? opacityCurves;

  const CheckboxListView({
    Key? key,
    required this.items,
    required this.checked,
    required this.onChangedMainMuscleEnum,
    required this.getTitle,
    this.beginOffset,
    this.endOffset = Offset.zero,
    this.offsetStartInterval = 0.0,
    this.offsetDelay = 0.05,
    this.offsetDuration = 0.25,
    this.offsetCurves = Curves.decelerate,
    this.opacityStartInterval = 0.0,
    this.opacityDelay = 0.05,
    this.opacityDuration = 0.25,
    this.opacityCurves = Curves.decelerate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = items[index];
          final offsetBegin = offsetStartInterval! + offsetDelay! * index;
          final offsetEnd = offsetBegin + offsetDuration!;

          assert(offsetEnd <= 1);

          final opacityBegin = opacityStartInterval! + opacityDelay! * index;
          final opacityEnd = opacityBegin + opacityDuration!;

          assert(opacityEnd <= 1);

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      color: checked(item)
                          ? const Color(0xffdd4124)
                          : const Color(0xff3C3C3C),
                      child: CheckboxListTile(
                          activeColor: const Color(0xffa6301b),
                          title: Text(getTitle(item)),
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: checked(item),
                          selected: checked(item),
                          onChanged: (bool? checked) =>
                              onChangedMainMuscleEnum(checked, item)))));
        });
  }
}
