import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class themeBottomSheet extends StatelessWidget {
  const themeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Text(
            AppLocalizations.of(context)!.dark,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
