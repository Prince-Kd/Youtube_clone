import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/video_card.dart';

class VideoPost extends StatelessWidget {
  int index;
  VideoPost({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoCard(index: index,),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 25),
          //color: Colors.amber,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 16,
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Utah Jazz vs Los Angeles Lakers Full Game Highlight | January 17 | 2022 fhfushfu',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(fontSize: 17, ),
                    ),
                    const SizedBox(height: 5,),
                    Text('Hooper Highlights . 120K views . 9 hours ago', style: TextStyle(color: Colors.grey[600]),)
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 20,),
            ],
          ),
        )
      ],
    );
  }
}
