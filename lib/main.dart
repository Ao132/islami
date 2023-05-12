import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_content_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/sura.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(ChangeNotifierProvider(create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.nightTheme,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Sura.routeName: (context) => const Sura(),
        HadeethContentScreen.routeName: (context) => const HadeethContentScreen(),
      },
    );
  }

  initSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String lang = prefs.getString('lang') ?? 'en';
    String theme = prefs.getString('theme') ?? 'light';
    provider.changeLang(lang);
    theme == 'light' ? provider.changeTheme(ThemeMode.light) : provider.changeTheme(ThemeMode.dark);
  }
}
