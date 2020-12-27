import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import '../constants.dart';

class RecentChats extends StatelessWidget {
  final String userId = 'YHRJauj0omPep7Z9HKi8MG2HFKi2';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('conversations')
          .where('members', arrayContains: userId)
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
                          userId: userId,
                          conversationId: doc.documentID,
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