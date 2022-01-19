import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';
import 'package:youtube_clone/widgets/header.dart';
import 'package:youtube_clone/widgets/video_post.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            Header(
              bottom: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate(List.generate(10, (index) => VideoPost(index: index,),)))
          ],
        ),
      ),
    );
  }
}
