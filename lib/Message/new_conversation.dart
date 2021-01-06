import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'chat_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
CollectionReference _ref;
AsyncSnapshot<QuerySnapshot> snapshot;

// burada async olma durumunu çözmek lazım açıyor ama sayfaya gitmiyor.
openChat(BuildContext context, String currentUserUID, String postOwnerUID) {
  snapshot.data.docs.map((doc) =>
  Navigator.push(context, MaterialPageRoute(
      builder: (content) {
        return ChatScreen( // we have to pass these arguments to our chat_screen in order to get chat information of that user
        userId: currentUserUID,
        conversationId: doc.id,
        senderId: postOwnerUID,
      );
      })));
}

newConversation(String currentUserUID, String postOwnerUID) {
  FirebaseFirestore.instance.collection('conversations').add({
    'displayMessage': '',
    'members': [currentUserUID, postOwnerUID],
  });

}

