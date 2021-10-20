import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../empty_content.dart';

/// A wrapper around [StreamBuilder] which makes it easy to display
/// the various states of streaming data.
///
/// There are 4 possible states:
/// 1. The snapshot is loading:
/// --> shows the [loadingIndicator].
///
/// 2. The snapshot is loaded:
/// --> shows the widget returned by the [dataBuilder].
///
/// 3. The snapshots data is loaded but empty (only works on Iterable/Map):
/// --> shows [SnapshotStateInfo] with the [isEmptyText] and [isEmptyIcon].
///
/// 4. The snapshot has an error:
/// --> shows [SnapshotStateInfo] with the [errorText], [errorIcon] and the error message.
/// NOTE: For safety reasons the snapshots error message is only shown in debug mode.

class EasyStreamBuilder<T> extends StatelessWidget {

  const EasyStreamBuilder({
    Key? key,
    required this.stream,
    required this.dataBuilder,
    this.loadingIndicator = const CircularProgressIndicator(),
  }) : super(key: key);

  /// The asynchronous computation to which this builder is currently connected.
  final Stream<T> stream;

  /// The widget which displays the snapshot's data when it's loaded.
  ///
  /// NOTE: When the snapshots data is of Type Iterable/Map and empty [SnapshotStateInfo]
  /// with the [isEmptyText] and [isEmptyIcon] is shown instead.
  final Widget Function(BuildContext context, T data) dataBuilder;

  /// The widget which is shown while fetching the snapshots data.
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          if (kDebugMode) {
            throw (snapshot.error!);
          }

          return EmptyContent(message: snapshot.error?.toString());
        } else if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingIndicator;
          } else if (snapshot.data == null && null is T) {
            return dataBuilder(context, snapshot.data as T);
          } else {
            if (kDebugMode) {
              throw (snapshot.error!);
            }

            return EmptyContent(message: snapshot.error?.toString());
          }
        } else {
          final isEmpty = snapshot.data is Iterable
              ? (snapshot.data as Iterable).isEmpty
              : snapshot.data is Map
                  ? (snapshot.data as Map).isEmpty
                  : false;

          return isEmpty
              ? const EmptyContent(message: 'No Contents....')
              : dataBuilder(context, snapshot.data as T);
        }
      },
    );
  }
}
