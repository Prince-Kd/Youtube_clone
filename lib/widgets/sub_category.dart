import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey[200],
                  backgroundColor: Colors.grey[100],
                  padding: const EdgeInsets.only(left: 5, right: 15),

                ),
                onPressed: (){}, child: Row(
              children: [
                Image.asset('assets/compass.png', height: 24, width: 24,),
                const SizedBox(width: 8,),
                const Text('Explore', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),)
              ],
            )),
            const SizedBox(width: 8,),
            VerticalDivider(color: Colors.grey[400]),
            const SizedBox(width: 8,),
            ...chips!,
          ],
        ),
      ),
    );
  }
}
