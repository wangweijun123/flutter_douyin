import 'package:flutter/material.dart';
import 'package:fullter_douyin/util/log_util.dart';

import 'fade_through_transition.dart';
import 'first_page/first_page.dart';
import 'friend/friends_dart.dart';
import 'message/message_page.dart';
import 'page_transition_switcher.dart';
// import 'package:animations/animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'douyin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'douyin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    FirstPage(),
    FriendsPage(),
    MessagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pageList[pageIndex],
        ),
      ),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: pageIndex,
        onTap: (int newValue) {
          setState(() {
            pageIndex = newValue;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
