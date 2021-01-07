import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  final String conversationId;
  final String userName;
  final String userPhoto;
  // our needed instances when we want to talk with a person it has to have this properties
  const ChatScreen({this.userId, this.conversationId, this.userName, this.userPhoto});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _editingController = TextEditingController();
  CollectionReference _ref;
  FocusNode _focusNode;

  void initState() {
    // we have assigned messages between persons into what we call _ref
    _ref = FirebaseFirestore.instance
        .collection('conversations/${widget.conversationId}/messages');
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.userPhoto), // example user photo
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.userName),),// we get from here which person sent the message
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/splashLogo.png'), // chatscreen background image
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _focusNode.unfocus(),
                child: StreamBuilder(
                    stream: _ref.orderBy('timeStamp').snapshots(), //we build our stream with timestamp in order to sort which user sent most recent message
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : ListView(
                        reverse: true, // in this part what we do is actually look for who sent the message and allign the messages based on users
                        children: snapshot.data.docs.reversed
                            .map(
                              (document) => ListTile(
                            title: Container(
                              alignment:
                              widget.userId == document['sender_id']
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              margin:
                              widget.userId == document['sender_id']
                                  ? EdgeInsets.only(
                                  top: 8, bottom: 3, left: 80)
                                  : EdgeInsets.only(
                                  top: 8, bottom: 3, right: 80),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: widget.userId ==
                                      document['sender_id']
                                      ? Colors.green.shade100.withOpacity(0.96)
                                      : Colors.grey
                                      .shade200.withOpacity(0.96), //kullanıcıya göre mesaj kutusunun köşesi sağ veya sol oluyor
                                  borderRadius: widget.userId ==
                                      document['sender_id']
                                      ? BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft:
                                    Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  )
                                      : BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                    bottomRight:
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  document['message'], // we get our instance message and pop it on screen
                                ),
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      );
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Row(children: [
                IconButtonWidget(
                  icon: Icon(Icons.camera_alt), //in later it will be added photos to take and send it via our app
                  iconSize: 30,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField( // here is our chatbox.
                    focusNode: _focusNode,
                    controller: _editingController,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) {},
                    decoration: InputDecoration.collapsed(
                      hintText: 'Mesaj Gönder...',
                    ),
                  ),
                ),
                IconButtonWidget(
                  icon: Icon(Icons.send),
                  iconSize: 30,
                  onPressed: () async { // when we press this the information given below will be added to our firebase firestore
                    await _ref.add({
                      'sender_id': widget.userId,
                      'message': _editingController.text,
                      'timeStamp': DateTime.now(),
                    });
                    _editingController.text = ''; // when a message has sent it refreshes chat box
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
// we have defined a icon widget so that we can use its instance's over and over again without typing so much
class IconButtonWidget extends StatelessWidget {
  Icon icon;
  double iconSize;
  Function onPressed;

  IconButtonWidget(
      {@required this.icon, @required this.iconSize, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: iconSize,
      color: kLightGrayColor,
      onPressed: onPressed,
    );
  }
}