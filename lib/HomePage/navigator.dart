import 'package:flutter/material.dart';
import 'package:sharify/HomePage/add_page.dart';
import '../Forum/forumTabs.dart';
import 'profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'homePage.dart';
import 'package:sharify/Message/messageHomeScreen.dart';

/// Navigator for bottom navigation bar.
class navigator extends StatefulWidget {
  @override
  _navigatorState createState() => _navigatorState();
}

class _navigatorState extends State<navigator> {
  // initializing tabs.
  int selectedPage = 0;
  final _pageOption = [
    Home(),
    forumTabs(),
    addPage(),
    MessageHomeScreen(),
    profilePage()
  ];
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
            // adding tabs.
            TabItem(
              icon: Icons.home,
              title: 'Home',
            ),
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
          }),
    );
  }
}
