import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_content_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/quran/sura.dart';
import 'package:islami/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Sura.routeName: (context) => const Sura(),
        HadeethContentScreen.routeName: (context) => const HadeethContentScreen(),
      },
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.nightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
    );
  }
}
