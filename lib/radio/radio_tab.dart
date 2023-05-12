import 'package:islami/theme.dart';
import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_tab_image.png'),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous, color: AppTheme.lightPrimary, size: 40),
              Icon(Icons.play_arrow, color: AppTheme.lightPrimary, size: 40),
              Icon(Icons.skip_next, color: AppTheme.lightPrimary, size: 40),
            ],
          )
        ],
      ),
    );
  }
}
