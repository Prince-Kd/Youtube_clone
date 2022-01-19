import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/widgets/short_vid.dart';

class Shorts extends StatelessWidget {
  const Shorts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    List<Widget> shorts = List.generate(13, (index) => ShortVid(index: index));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(Icons.camera_alt_outlined, color: Colors.white,),
        ],
      ),
      body: Builder(
        builder: (context) {
          return CarouselSlider(
            options: CarouselOptions(
              reverse: false,
              enableInfiniteScroll: false,
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              scrollDirection: Axis.vertical,
              // autoPlay: false,
            ),
            items: [
              ...shorts
            ],
          );
        }
      )
    );
  }
}
