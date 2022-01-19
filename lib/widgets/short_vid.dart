import 'package:flutter/material.dart';

class ShortVid extends StatelessWidget {
  final int index;
  const ShortVid({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/shorts/$index.jpeg',
          fit: BoxFit.fitHeight,
          height: height,
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: Column(
              children: [
                const Icon(Icons.more_horiz, color: Colors.white),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const [
                    Icon(Icons.thumb_up_sharp, color: Colors.white),
                    Text(
                      '2.9M',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const [
                    Icon(Icons.thumb_down_sharp, color: Colors.white),
                    Text(
                      'Dislike',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const [
                    Icon(Icons.chat_rounded, color: Colors.white),
                    Text(
                      '2.9M',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const [
                    Icon(Icons.forward, color: Colors.white),
                    Text(
                      'Share',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Image.asset('assets/vids/${index + 1}.jpeg',
                      fit: BoxFit.fitWidth),
                )
              ],
            )),
        Positioned(
          bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 250,
              child: Text('The pass or the shot? #stephcurry #steph #curry #nba', softWrap: true, style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/shorts/$index.jpeg'),
                ),
                const SizedBox(width: 8,),
                const Text(
                  'hoops land',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16
                  ),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  height: 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                    onPressed: () {},
                    child: const Text(
                      'SUBSCRIBE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
