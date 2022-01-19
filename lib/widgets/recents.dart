import 'package:flutter/material.dart';

class Recents extends StatelessWidget {
  final int? index;
  const Recents({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: 180,
                    height: 100,
                    child: Image.asset(
                      'assets/vids/${index! + 1}.jpeg',
                      fit: BoxFit.fitWidth,
                    )),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        '9:45',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: Text(
                      '7 things women do when they genuinely love you',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),),
                    Icon(Icons.more_vert, size: 20,)
                  ],
                ),
                const Text('Jessica Os', style: TextStyle(fontSize: 13, color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
