import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'recent_chats.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: kLocationIcon,
                    ),
                  ),
                  TextSpan(
                    text: 'Kağıthane, İstanbul',
                    style: kSFProRegular.copyWith(
                        color: kGreencolor, fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButtonWidget(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'messages',
                  style:
                      kSFProRegular.copyWith(fontSize: 30, color: kGrayColor),
                ),
              ),
            ),
          ),
          RecentChats(),
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      iconSize: 35,
      color: Colors.black,
      onPressed: () {},
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.white,
      color: kGrayColor,
      style: TabStyle.fixed,
      activeColor: kGreencolor,
      items: [
        TabItem(icon: CupertinoIcons.compass, title: 'Konum'),
        TabItem(icon: CupertinoIcons.chat_bubble_2, title: 'Forum'),
        TabItem(icon: Icons.add, title: 'Ekle'),
        TabItem(icon: CupertinoIcons.chat_bubble, title: 'Mesaj'),
        TabItem(icon: Icons.person_outline, title: 'Profil'),
      ],
    );
  }
}
