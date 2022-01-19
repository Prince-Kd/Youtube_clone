import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  int index;
  VideoCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.blue,
      height: 180,
      child: Stack(children: [
        Image.asset(
          'assets/vids/${index+1}.jpeg',
          fit: BoxFit.fitWidth,
          width: width,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                  )
                ]
            ),
            child: Center(child: Text('9:45', style: TextStyle(color: Colors.white),),),
          ),
        ),
      ]),
    );
  }
}
