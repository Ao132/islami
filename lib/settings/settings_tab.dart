import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/settings/lang_bottom_sheet.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          InkWell(
            onTap: () {
              langBottomSheet();
            },
            child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.lightPrimary),
                    borderRadius: BorderRadius.circular(12),
                    color: provider.isDark() ? AppTheme.darkPrimary : AppTheme.lightPrimary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguage == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Icon(Icons.arrow_drop_down_outlined)
                  ],
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Text(
            AppLocalizations.of(context)!.themeing,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          InkWell(
            onTap: () {
              themeingBottomSheet();
            },
            child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.lightPrimary),
                    borderRadius: BorderRadius.circular(12),
                    color: provider.isDark() ? AppTheme.darkPrimary : AppTheme.lightPrimary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      !provider.isDark() ? AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Icon(Icons.arrow_drop_down_outlined)
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void langBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => const LangBottomSheet());
  }

  void themeingBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => const ThemeBottomSheet());
  }
}
