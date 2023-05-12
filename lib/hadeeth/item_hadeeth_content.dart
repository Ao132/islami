import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemHadeethDetails extends StatelessWidget {
  ItemHadeethDetails({super.key, required this.content});
  String content;
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    return Text(
      content,
      style: 
      
      provider.isDark()
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.yellowColor)
          : 
      Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
