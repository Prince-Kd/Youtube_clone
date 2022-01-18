import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/widgets/custom_widgets.dart';
import 'package:youtube_clone/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(),
        ],

      ),
    );
  }
}
