import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemSuraDetails extends StatelessWidget {
  ItemSuraDetails({super.key, required this.name, required this.index});
  String name;
  int index;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$name(${index+1})',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
