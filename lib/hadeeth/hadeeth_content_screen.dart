import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/hadeeth/item_hadeeth_content.dart';

class HadeethContentScreen extends StatefulWidget {
  static const String routeName = 'hadeeth_con_Sc';

  const HadeethContentScreen({super.key});

  @override
  State<HadeethContentScreen> createState() => _HadeethContentScreenState();
}

class _HadeethContentScreenState extends State<HadeethContentScreen> {
  @override
  Widget build(BuildContext context) {
    Hadeeth args = ModalRoute.of(context)?.settings.arguments as Hadeeth;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(children: [
      Image.asset('assets/images/main_background.png', fit: BoxFit.fill, height: double.infinity, width: double.infinity),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Container(
          width: width * .9,
          height: height * .9,
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.only(right: width * .09, left: width * .09, bottom: height * .09),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0), //(x,y)
                  blurRadius: 6.0)
            ],
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: ListView.builder(
              itemBuilder: (context, index) => ItemHadeethDetails(content: args.content[index]), itemCount: args.content.length),
        ),
      ),
    ]);
  }
}
