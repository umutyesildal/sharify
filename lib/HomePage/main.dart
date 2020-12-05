
import 'package:flutter/material.dart';
import 'forum_page.dart';
import 'add_page.dart';
import 'message_page.dart';
import 'profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedPage = 0;
  final _pageOption = [Home(), forumPage(), addPage(), messagePage(),profilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[selectedPage],

      bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: selectedPage,
          height: 50,
          top: -30,
          curveSize: 100,
          style: TabStyle.fixed,
          color: Colors.black45,
          activeColor: Colors.green,
          items: [
            TabItem(icon: Icons.home, title: 'Home',),
            TabItem(icon: Icons.forum, title: 'Forum'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          backgroundColor: Colors.white,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          }
      ),
    );




  }
}
