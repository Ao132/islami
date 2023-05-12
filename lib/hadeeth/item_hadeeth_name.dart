import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_content_screen.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';

// ignore: must_be_immutable
class ItemHadeethName extends StatelessWidget {
  ItemHadeethName({super.key, required this.hadeeth});
  Hadeeth hadeeth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadeethContentScreen.routeName, arguments: hadeeth);
      },
      child: Text(
        hadeeth.title,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
