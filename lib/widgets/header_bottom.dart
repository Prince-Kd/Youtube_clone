import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';

class HeaderBottom extends StatelessWidget {
  List<Widget>? chips;
  HeaderBottom({Key? key, this.chips}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]!, width: 0.5),
            bottom: BorderSide(color: Colors.grey[200]!, width: 0.5),
          )
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 15),
        child: ListView(
          scrollDirection: Axis.horizontal,
          primary: false,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey[200],
                  backgroundColor: Theme.of(context).cardColor,
                  padding: const EdgeInsets.only(left: 5, right: 15),

                ),
                onPressed: (){}, child: Row(
              children: [
                Image.asset('assets/compass.png', height: 24, width: 24,),
                const SizedBox(width: 8,),
                Text('Explore', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Theme.of(context).textTheme.bodyText1!.color),)
              ],
            )),
            const SizedBox(width: 8,),
            VerticalDivider(color: Colors.grey[400]),
            const SizedBox(width: 8,),
            CustomChips(val: 700, text: 'All',),
            ...chips!,
          ],
        ),
      ),
    );
  }
}
