import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'Today',
      'Continue watching',
      'Unwatched',
      'Live',
      'Posts',
    ];
    List<Widget> chips = texts.map((text) => CustomChips(text: text,)).toList();
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]!, width: 1),
            bottom: BorderSide(color: Colors.grey[200]!, width: 1),
          )
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 15),
        child: ListView(
          scrollDirection: Axis.horizontal,
          primary: false,
          children: [
            const CustomChips(text: 'All', val: 700,),
            ...chips,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text('SETTINGS', style: TextStyle(color: Colors.blue[700], fontSize: 16, fontWeight: FontWeight.w600),),
            )
          ],
        ),
      ),
    );
  }
}
