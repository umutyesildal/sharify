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
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return Expanded(
          flex: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: snapshot.data.documents
                  .map((doc) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.addsystems.com/wp-content/uploads/2017/01/Anonym-e1491994623630.jpg'),
                ),
                title: Text(doc['senderName']),
                subtitle: Text(doc['displayMessage']),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (content) => ChatScreen(
                          userId: _auth.currentUser.uid,
                          conversationId: doc.documentID,
                          senderName: doc['senderName'],
                          senderId: _auth.currentUser.uid != doc['members'][0].toString() ? doc['members'][0].toString(): doc['members'][1].toString()
                        ))),
                trailing: Column(
                  children: [
                    Text('19:30'),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
