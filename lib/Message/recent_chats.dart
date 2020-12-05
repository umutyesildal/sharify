import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'models/message_model.dart';
import 'chat_screen.dart';
import 'constants.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final chat = chats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          user: chat.sender,
                        ),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: kSFProTextSemibold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: kSFProTextRegularRecentChat,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Divider(
                                  color: kLightGrayColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chat.time,
                            style: kSFProTextRegularRecentChat,
                          ),
                          Text(''), // İsimle hizalı olması için kolay çözüm
                          Text(''), // Aynı
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
