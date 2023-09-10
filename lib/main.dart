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
      body: IndexedStack(
        index: pageIndex,
        children: pageList,
      ),

      // 使用底部导航栏实现tab切换，行不通，页面的状态被清除了
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: pageIndex,
        onTap: (int newValue) {
          myPrint('底部导航栏切换 当前 newValue = $newValue');
          if (newValue != 0) {
            FirstPage firstPage = pageList[0] as FirstPage;
            myPrint('底部导航栏切换 调用暂停播放');
            firstPage.pasusePlay();
          } else {
            FirstPage firstPage = pageList[0] as FirstPage;
            myPrint('底部导航栏切换 调用播放');
            firstPage.startPlay();
          }

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
