import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'models/message_model.dart';
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
                        title: Text('Dali'),
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

    // return Expanded(
    //   flex: 8,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //     ),
    //     child: ListView.builder(
    //         itemCount: chats.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           final chat = chats[index];
    //           return GestureDetector(
    //             onTap: () {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (_) => ChatScreen(
    //                       user: chat.sender,
    //                     ),
    //                   ));
    //             },
    //             child: Container(
    //               margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
    //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       CircleAvatar(
    //                         radius: 23,
    //                         backgroundImage: AssetImage(chat.sender.imageUrl),
    //                       ),
    //                       SizedBox(
    //                         width: 10,
    //                       ),
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             chat.sender.name,
    //                             style: kSFProTextSemibold.copyWith(
    //                                 color: Colors.black, fontSize: 17),
    //                           ),
    //                           SizedBox(
    //                             height: 5,
    //                           ),
    //                           Container(
    //                             width: MediaQuery.of(context).size.width * 0.45,
    //                             child: Text(
    //                               chat.text,
    //                               style: kSFProTextRegularRecentChat,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: Divider(
    //                               color: kLightGrayColor,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       Text(
    //                         chat.time,
    //                         style: kSFProTextRegularRecentChat,
    //                       ),
    //                       Text(''), // İsimle hizalı olması için kolay çözüm
    //                       Text(''), // Aynı
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         }),
    //   ),
    // );
  }
}
