
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/item_hadeeth_name.dart';
import 'package:islami/theme.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethList.isEmpty) {
      loadHadeethFile();
    }

    return Column(children: [

      Expanded(
        flex: 2,
         child:
          Image.asset('assets/images/hadeeth_tab_image.png')),
      Divider(
        color: AppTheme.lightPrimary,
        thickness: 2,
      ),
      Text(
        AppLocalizations.of(context)!.hadeeth_name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Divider(
        color: AppTheme.lightPrimary,
        thickness: 3,
      ),
      Expanded(
        flex: 3,
        child: hadeethList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: AppTheme.lightPrimary,
                  thickness: 2,
                ),
                itemBuilder: (context, index) => ItemHadeethName(
                  hadeeth: hadeethList[index],
                ),
                itemCount: hadeethList.length,
              ),
      ),
    ]);
  }

  void loadHadeethFile() async {
    String fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeethList = fileContent.split('#\r\n');
    for (int i = 0; i < allHadeethList.length; i++) {
      List<String> singleHadeeth = allHadeethList[i].split('\n');
      String title = singleHadeeth[0];
      singleHadeeth.removeAt(0);
      Hadeeth hadeeth = Hadeeth(title: title, content: singleHadeeth);
      hadeethList.add(hadeeth);
    }
    setState(() {});
  }
}

class Hadeeth {
  String title;
  List<String> content;
  Hadeeth({
    required this.title,
    required this.content,
  });
}
