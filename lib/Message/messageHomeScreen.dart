import 'package:flutter/material.dart';
import 'recent_chats.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class messageHomeScreen extends StatefulWidget {
  @override
  _messageHomeScreenState createState() => _messageHomeScreenState();
}

class _messageHomeScreenState extends State<messageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
          Material(
            elevation: 20,
            color: Colors.white,
            child: SizedBox(
              height: 5,
              width: double.infinity,
              child: Divider(
                color: Colors.white,
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