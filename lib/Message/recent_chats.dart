import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class RecentChats extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('conversations')
          .where('members', arrayContains: _auth.currentUser.uid)
          .snapshots(), // we get our user information from conversations' members where we are the one of the user of course
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // if there is none error
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...'); // it is a async and it takes time so while loading it gives text to user that says loading
        }
        return Expanded(
          flex: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: snapshot.data.docs
                  .map((doc) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.addsystems.com/wp-content/uploads/2017/01/Anonym-e1491994623630.jpg'),// user image
                ),
                title: Text('denemelik'), //our user infos
                subtitle: Text(doc['displayMessage']),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (content) => ChatScreen( // we have to pass these arguments to our chat_screen in order to get chat information of that user
                          userId: _auth.currentUser.uid,
                          conversationId: doc.id,
                          senderId: _auth.currentUser.uid != doc['members'][0].toString() ? doc['members'][0].toString(): doc['members'][1].toString()
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
