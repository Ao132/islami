import 'package:flutter/material.dart';
import 'package:islami/hadeeth_tab.dart';
import 'package:islami/quran_tab.dart';
import 'package:islami/radio_tab.dart';
import 'package:islami/sebha_tab.dart';

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
      Image.asset('assets/images/main_background.png', fit: BoxFit.fill, height: double.infinity, width: double.infinity),
      Scaffold(
        body: tabs[selectedIndex],
        appBar: AppBar(
          title: Text(
            'Islami',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    label: 'Quran',
                    icon: ImageIcon(
                      AssetImage('assets/images/quran_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Hadeeth',
                    icon: ImageIcon(
                      AssetImage('assets/images/hadeeth_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Tasbeh',
                    icon: ImageIcon(
                      AssetImage('assets/images/sebha_icon.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Radio',
                    icon: ImageIcon(
                      AssetImage('assets/images/radio_icon.png'),
                    ))
              ]),
        ),
      ),
    ]);
  }

  List<Widget> tabs = [
     QuranTab(),HadeethTab(),const SebhaTab(),const RadioTab()
  ];
}
