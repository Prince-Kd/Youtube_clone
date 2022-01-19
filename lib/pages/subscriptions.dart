import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/header.dart';
import 'package:youtube_clone/widgets/sub_avatar.dart';
import 'package:youtube_clone/widgets/sub_category.dart';
import 'package:youtube_clone/widgets/video_post.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> subs = List.generate(10, (index) => SubAvatar(index: index, name: 'Mawuli Prince'));
    List<Widget> posts = List.generate(10, (index) => VideoPost(index: index,),);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          Header(bottom: false,),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              height: 105,
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...subs
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('ALL', style: TextStyle(color: Colors.blue[800], fontSize: 16),),
                  )
                ],
              ),
            ),
            SubCategory(),
            ...posts,
          ]))
        ],
      ),
    );
  }
}
