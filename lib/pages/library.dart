import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/header.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(bottom: false,)
        ],
      ),
    );
  }
}
