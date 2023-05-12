import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              provider.changeLang('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedLangWidget(
                    context,
                    AppLocalizations.of(context)!.english,
                  )
                : getUnSelectedLangWidget(
                    context,
                    AppLocalizations.of(context)!.english,
                  ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          GestureDetector(
            onTap: () {
              provider.changeLang('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedLangWidget(
                    context,
                    AppLocalizations.of(context)!.arabic,
                  )
                : getUnSelectedLangWidget(
                    context,
                    AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Text getUnSelectedLangWidget(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.blackColor),
    );
  }

  Row getSelectedLangWidget(BuildContext context, String text) {
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
