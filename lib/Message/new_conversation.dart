import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharify/Message/messageHomeScreen.dart';

// burada async olma durumunu çözmek lazım açıyor ama sayfaya gitmiyor.
openChat(BuildContext context, String currentUserUID, String postOwnerUID) {
   // snapshot.data.docs.map((conversation)  async =>
   // await Navigator.push(context,
   //    MaterialPageRoute(
   //      builder: (content) => ChatScreen(// we have to pass these arguments to our chat_screen in order to get chat information of that user
   //        userId: currentUserUID,
   //        conversationId: conversation.id,
   //        senderId: postOwnerUID,
   //      ),
   //    )));

  // yukarıdaki kısım direkt iki kişi arasındaki mesaj sayfasına giriyor ama şuanda
  //async sorununu çözemediğim için mesaj ana sayfasına yönlendirmeyi yapıyorum.
  Navigator.push(context, MaterialPageRoute(builder: (content)=> MessageHomeScreen()));
  // bottom bar kayboluyor ama çözüm bulacaz inş
}

newConversation(String currentUserUID, String postOwnerUID) {
  if (currentUserUID == postOwnerUID){
    return null;
  }
  FirebaseFirestore.instance.collection('conversations').add({
    'displayMessage': '',
    'members': [currentUserUID, postOwnerUID],
  });
}
