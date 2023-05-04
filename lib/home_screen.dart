import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/quran/quran_tab.dart';
import 'package:islami/radio/radio_tab.dart';
import 'package:islami/settings/settings_tab.dart';
import 'package:islami/tasbeh/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/images/main_background.png',
          fit: BoxFit.fill, height: double.infinity, width: double.infinity),
      Scaffold(
        body: tabs[selectedIndex],
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.quran,
                    icon: const ImageIcon(
                      AssetImage('assets/images/quran_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeeth,
                    icon: const ImageIcon(
                      AssetImage('assets/images/hadeeth_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.tasbeh,
                    icon: const ImageIcon(
                      AssetImage('assets/images/sebha_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon: const ImageIcon(
                      AssetImage('assets/images/radio_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.settings,
                    icon: const Icon(Icons.settings))
              ]),
        ),
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranTab(),
    const HadeethTab(),
     SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}
