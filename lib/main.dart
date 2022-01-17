import 'package:flutter/material.dart';
import 'package:youtube_clone/pages/create.dart';
import 'package:youtube_clone/pages/home.dart';
import 'package:youtube_clone/pages/library.dart';
import 'package:youtube_clone/pages/shorts.dart';
import 'package:youtube_clone/pages/subscriptions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
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
            height: 300,
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
                          IconButton(onPressed: (){}, icon: Icon(Icons.close)),
                        ],
                      ),
                    ),
                  //const SizedBox(height: 20,),
                  ListTile(
                    enableFeedback: true,
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 30,
                      child: Center(child: Icon(Icons.ondemand_video_sharp, color: Colors.black,),),
                    ),
                    title: const Text('Create a Short', style: TextStyle(fontSize: 18)),
                  )
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
        onTap: _onTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.ondemand_video_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.add_circle_outline,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.video_collection_outlined),
            activeIcon: Icon(Icons.video_collection),
          ),
        ],
      ),
    );
  }
}
