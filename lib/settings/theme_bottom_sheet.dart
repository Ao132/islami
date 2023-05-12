import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: !provider.isDark()
                ? getSelectedThemeWidget(context, AppLocalizations.of(context)!.light)
                : getUnSelectedThemeWidget(context, AppLocalizations.of(context)!.light),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDark()
                ? getSelectedThemeWidget(context, AppLocalizations.of(context)!.dark)
                : getUnSelectedThemeWidget(context, AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Text getUnSelectedThemeWidget(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.darkPrimary),
    );
  }

  Row getSelectedThemeWidget(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
