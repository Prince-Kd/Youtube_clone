import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'All',
      'NBA',
      'Angular',
      'Computer programming',
      'Smartphones',
      'Trailers',
      'Linux',
      'Calculus',
      'Marvel Cinematic Universe',
      'Anime',
      'Sketch comedy',
      'Balls'
    ];
    List<Widget> chips = texts.map((text) => CustomChips(text: text,)).toList();
    return SliverAppBar(
        snap: true,
        floating: true,
        title: Row(
          children: [
            SizedBox(height: 24, child: Image.asset('assets/logo.png', fit: BoxFit.contain, filterQuality: FilterQuality.high,)),
            const Text('Youtube', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Oswald', fontSize: 24),),
          ],
        ),
        actions: [
          const Icon(Icons.cast),
          const SizedBox(width: 20,),
          const Icon(Icons.notifications_none),
          const SizedBox(width: 20,),
          const Icon(Icons.search),
          const SizedBox(width: 20,),
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.blue[600],
            child: const Center(child: Text('P', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
          ),
          const SizedBox(width: 18,),
        ],
        bottom: PreferredSize(
          child: Container(
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
                    children: const [
                      Icon(MyFlutterApp.compass, color: Colors.black,),
                      SizedBox(width: 8,),
                      Text('Explore', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),)
                    ],
                  )),
                  const SizedBox(width: 8,),
                  VerticalDivider(color: Colors.grey[400]),
                  const SizedBox(width: 8,),
                  ...chips,
                ],
              ),
            ),
          ),
          preferredSize: const Size(double.infinity, 50),
        )
    );
  }
}
