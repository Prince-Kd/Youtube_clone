import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/header.dart';
import 'package:youtube_clone/widgets/library_tile.dart';
import 'package:youtube_clone/widgets/recents.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> recents = List.generate(
        10,
        (index) => Recents(
              index: index,
            ));
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            Header(
              bottom: false,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recent',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [...recents],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: const [
                    LibraryTile(
                        title: 'History',
                        icon: Icon(Icons.history, size: 30,)),
                    SizedBox(
                      height: 5,
                    ),
                    LibraryTile(
                        title: 'Your videos',
                        icon: Icon(Icons.play_circle_outline, size: 30,)),
                    SizedBox(
                      height: 5,
                    ),
                    LibraryTile(
                        title: 'Downloads',
                        subTitle: '2 videos',
                        icon: Icon(Icons.file_download_sharp, size: 30,)),
                    SizedBox(
                      height: 5,
                    ),
                    LibraryTile(
                      title: 'Your movies',
                      icon: Icon(
                        Icons.local_movies_outlined,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LibraryTile(
                        title: 'Watch later',
                        subTitle: '14 unwatched videos',
                        icon: Icon(Icons.watch_later_outlined, size: 30,)),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text('Playlists', style: TextStyle(fontSize: 17),)),
                        Text('Recently added', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LibraryTile(title: 'New playlist', color: Colors.blue[700], icon: Icon(Icons.add, color: Colors.blue[700], size: 30,),),
                    const SizedBox(
                      height: 15,
                    ),
                    const LibraryTile(title: 'Liked videos', subTitle: '14 liked videos', icon: Icon(Icons.thumb_up_outlined,),),
                    const SizedBox(
                      height: 15,
                    ),
                    LibraryTile(title: 'Ethical Hacking & Penetration Testing with ', icon: Image.asset('assets/vids/1.jpeg', width: 30, height: 30, fit: BoxFit.fitHeight,),)
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
