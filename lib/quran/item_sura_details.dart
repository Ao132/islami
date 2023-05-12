import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemSuraDetails extends StatelessWidget {

  ItemSuraDetails({super.key, required this.name, required this.index});
  String name;
  int index;
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Text(
      '$name(${index + 1})',
      style: provider.isDark()?Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.yellowColor):Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
