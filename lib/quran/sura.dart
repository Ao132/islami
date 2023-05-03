import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/item_sura_details.dart';
import 'package:islami/theme.dart';

class Sura extends StatefulWidget {
  static const String routeName = 'sura_det_Sc';

  const Sura({Key? key}) : super(key: key);

  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset('assets/images/main_background.png',
          fit: BoxFit.fill, height: double.infinity, width: double.infinity),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Container(
          width: width * .9,
          height: height * .9,
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.only(
              right: width * .09, left: width * .09, bottom: height * .09),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.0, 3.0), blurRadius: 6.0)
            ],
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: verses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) => ItemSuraDetails(
                        name: verses[index],
                        index: index,
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: AppTheme.lightPrimary,
                        thickness: 2,
                      ),
                  itemCount: verses.length),
        ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
