import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeshCounter = 0;
  List<String> tasbehList = [
    'سبحان اللَّه ',
    'الحمد للَّه ',
    'لا اله الا اللَّه ',
    'اللَّه اكبر',
    'لا حول ولا قوه الا باللَّه',
  ];
  int index = 0;
  double angle=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: sebhaClick,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(left: 100, child: Image.asset('assets/images/head of seb7a.png')),
                Padding(
                  padding: EdgeInsets.only(top: height * .1, bottom: height * .02),
                  child: Transform.rotate(angle: angle,child: Image.asset('assets/images/body of seb7a.png')),
                ),
              ],
            ),
          ),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.titleMedium),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.lightPrimary, borderRadius: BorderRadius.circular(26)),
            child: Text('$tasbeshCounter', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.lightPrimary, borderRadius: BorderRadius.circular(26)),
            child: Text(tasbehList[index], style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  sebhaClick() {
    tasbeshCounter++;
    if (tasbeshCounter % 33 == 0) {
      index++;
    }
    if(index==tasbehList.length){
      index=0;
    }
    angle+=360/33;
    setState(() {});
  }
}
