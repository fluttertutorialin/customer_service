import 'package:flutter/material.dart';
import '../empty_content.dart';

typedef SnapshotActiveBuilder<T> = Widget Function(
    BuildContext context, T data);

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder({
    Key? key,
    required this.stream,
    required this.builder,
    this.errorWidget,
    this.initialData,
    this.loadingWidget,
    this.emptyWidget,
  }) : super(key: key);

  final Stream<T> stream;
  final T? initialData;
  final SnapshotActiveBuilder<T> builder;

  /// A widget to be shown when snapshot returns error.
  ///
  /// Default is [EmptyContent] widget with errorOccuredMessage and error.
  ///
  final Widget? errorWidget;

  /// A widget to be shown when sapshot connection state is [ConnectionState.none],
  /// [ConnectionState.waiting], or [ConnectionState.done].
  ///
  /// Default widget is [CircularProgressIndicator] with color of [ThemeColors.primary500]
  ///
  final Widget? loadingWidget;

  /// A widget io be shown when `snapshot.data == null`.
  ///
  /// Default is [EmptyContent]
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        initialData: initialData,
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return errorWidget ??
                EmptyContent(
                    message: 'An error has occured', e: snapshot.error);
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.done:
                return loadingWidget ??
                    const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepOrange)));
              case ConnectionState.active:
                final data = snapshot.data;
                if (data != null) {
                  return builder(context, data);
                } else {
                  return emptyWidget ??
                      const EmptyContent(message: 'No Contents....');
                }
            }
          }
        });
  }
}
