import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';
import 'package:youtube_clone/widgets/header_bottom.dart';

class Header extends StatelessWidget {
  bool? bottom;
  Header({Key? key, this.bottom}) : super(key: key);

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
          Image.asset('assets/cast.png', height: 24, width: 24,),
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
        bottom: bottom == true ? PreferredSize(
          child: HeaderBottom(chips: chips),
          preferredSize: const Size(double.infinity, 50),
        ): (const PreferredSize(
          child: SizedBox(),
          preferredSize: Size(double.infinity, 0),
        ))
    );
  }
}
