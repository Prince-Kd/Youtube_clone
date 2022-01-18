import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/header.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({Key? key}) : super(key: key);

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
