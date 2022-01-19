import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youtube_clone/icons.dart';
import 'package:youtube_clone/pages/create.dart';
import 'package:youtube_clone/pages/home.dart';
import 'package:youtube_clone/pages/library.dart';
import 'package:youtube_clone/pages/shorts.dart';
import 'package:youtube_clone/pages/subscriptions.dart';
import 'package:youtube_clone/widgets/tile.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
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
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, Box box, widget) {
        bool darkMode = box.get('darkMode', defaultValue: true);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(
              hintColor: darkMode ? Colors.black : Colors.white,
              hoverColor: darkMode ? Colors.white : Colors.grey[200],
              cardColor: darkMode ? Colors.grey[800] : Colors.grey[200],
              dividerColor: darkMode ? Colors.grey[400] : Colors.grey[700],
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
              ),
              iconTheme: IconThemeData(
                color: darkMode ? Colors.white : Colors.black,
              ),
              scaffoldBackgroundColor: darkMode ? Colors.grey[900] : Colors.white,
              textTheme: Theme.of(context).textTheme.apply(
                bodyColor: darkMode ? Colors.grey[100] : Colors.black,
                displayColor: darkMode ? Colors.grey[100] : Colors.black,
              ),
              listTileTheme: ListTileThemeData(
                iconColor: darkMode ? Colors.white : Colors.black
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: darkMode ? Colors.black : Colors.white,
                unselectedIconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
                selectedIconTheme: IconThemeData(color: darkMode ? Colors.white :Colors.black),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: darkMode ? Colors.white : Colors.black
                ),
                titleTextStyle: TextStyle(
                  color: darkMode ? Colors.white : Colors.black
                )
              )
            ),
            home: BottomTab());
      }
    );
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
            decoration: BoxDecoration(
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
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
        //backgroundColor: Colors.white,
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
            icon: Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home_filled),
          ),
          const BottomNavigationBarItem(
            label: 'Shorts',
            icon: Icon(Icons.ondemand_video_outlined),
            activeIcon: Icon(Icons.ondemand_video)
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.add_circle_outline, size: 40,),
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
