import 'package:flutter/material.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/pages/create.dart';
import 'package:youtube_clone/pages/home.dart';
import 'package:youtube_clone/pages/library.dart';
import 'package:youtube_clone/pages/shorts.dart';
import 'package:youtube_clone/pages/subscriptions.dart';
import 'package:youtube_clone/widgets/tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    for(int i=1; i<11; i++){
      precacheImage(AssetImage('assets/vids/$i.jpeg'), context);
    }
    return MaterialApp(
        theme: ThemeData(
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.black
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedIconTheme: IconThemeData(color: Colors.black),
            selectedIconTheme: IconThemeData(color: Colors.black),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            titleTextStyle: TextStyle(
              color: Colors.black
            )
          )
        ),
        home: BottomTab());
  }
}

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    if(index == 2){
      showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(top:15, right: 10, left: 10, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            height: 310,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Create', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, ),),
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.close)),
                        ],
                      ),
                    ),
                  //const SizedBox(height: 20,),
                  const BottomTile(icon: Icon(Icons.ondemand_video_sharp, color: Colors.black,), text: 'Create a Short',),
                  BottomTile(icon: Image.asset('assets/upload.png', height: 24, width: 24,), text: 'Upload a video',),
                  BottomTile(icon: Image.asset('assets/youtube-live.png', height: 24, width: 24,), text: 'Go live',),
                ],
              ),
            ),
          );
        },
      );
    }else{
      setState(() {
        _selectedIndex = index;
      });
    }

  }

  static const List<Widget> pages = <Widget>[
    Home(),
    Shorts(),
    Create(),
    Subscriptions(),
    Library(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(fontSize: 11, color: Colors.black),
        selectedLabelStyle: const TextStyle(fontSize: 11, color: Colors.black),
        onTap: _onTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset('assets/home.png', height: 24, width: 24,),
            activeIcon: const Icon(Icons.home_filled),
          ),
          const BottomNavigationBarItem(
            label: 'Shorts',
            icon: Icon(Icons.ondemand_video_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/add.png', height: 40, width: 40,),
          ),
          const BottomNavigationBarItem(
            label: 'Subscriptions',
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
          ),
          const BottomNavigationBarItem(
            label: 'Library',
            icon: Icon(Icons.video_collection_outlined),
            activeIcon: Icon(Icons.video_collection),
          ),
        ],
      ),
    );
  }
}
