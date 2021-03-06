import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'recent_chats.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

// This page is actually just uı design when we open the chat screen
// What we see here our appbar and combination with other pages
class MessageHomeScreen extends StatefulWidget {
  @override
  _MessageHomeScreenState createState() => _MessageHomeScreenState();
}

class _MessageHomeScreenState extends State<MessageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
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
