import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc('Q3YDJJ8ya4WR6Q4J13QLSDHVXDj1')
        .get();
    userName = result.data()['userName'];
    userPhoto = result.data()['userPhoto'];

    setState(() {
      // when it is no longer waiting for a response, it returns not the circular indicator but it returns scaffold.
      isLoading = true;
    });
    }
  String userName;
  String userPhoto;
  // to check if awaiting response has came or not.
  bool isLoading = false;

  void initState(){
    giver();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      return Expanded(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('conversations')
            .where('members', arrayContains: _auth.currentUser.uid)
            .snapshots(),
        // we get our user information from conversations' members where we are the one of the user of course
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // if there is none error
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(
                'Loading...'); // it is a async and it takes time so while loading it gives text to user that says loading
          }
          return Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                children: snapshot.data.docs
                    .map((doc) =>
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userPhoto), // user image
                      ),
                      title: Text(userName),
                      //our user infos
                      subtitle: Text(doc['displayMessage']),
                      onTap: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (content) =>
                                      ChatScreen( // we have to pass these arguments to our chat_screen in order to get chat information of that user
                                          userId: _auth.currentUser.uid,
                                          conversationId: doc.id,
                                          userName: userName,
                                          userPhoto: userPhoto,
                                      ))),
                      trailing: Column(
                        children: [
                          Text('19:30'), // timestamp will be added
                        ],
                      ),
                    ))
                    .toList(), // map function needs to be converted into list if we want to have listview.
              ),
            ),
          );
        },
      );
    }
  }
}
