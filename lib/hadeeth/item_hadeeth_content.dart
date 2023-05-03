import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_content_screen.dart';

// ignore: must_be_immutable
class ItemHadeethDetails extends StatelessWidget {
  ItemHadeethDetails({super.key, required this.content});
  String content;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadeethContentScreen.routeName);
      },
      child: Text(
        content,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
