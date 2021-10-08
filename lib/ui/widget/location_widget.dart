import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Row(children: [
          const Icon(Icons.place_outlined),
          const SizedBox(width: 10),
          Expanded(child: Text('29 street of NY, New York City, USA',
                style: context.textTheme.bodyText1)),
          const SizedBox(width: 10),
          IconButton(icon: const Icon(Icons.gps_fixed), onPressed: () async {})
        ]));
  }
}
