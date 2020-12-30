import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  final String conversationId;
  final String senderName;
  final String senderId;

  const ChatScreen({this.userId, this.conversationId, this.senderName, this.senderId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _editingController = TextEditingController();
  CollectionReference _ref;
  FocusNode _focusNode;

  void initState() {
    _ref = Firestore.instance
        .collection('conversations/${widget.conversationId}/messages');
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.addsystems.com/wp-content/uploads/2017/01/Anonym-e1491994623630.jpg'
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.senderName),),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/splashLogo.png'),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _focusNode.unfocus(),
                child: StreamBuilder(
                    stream: _ref.orderBy('timeStamp').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : ListView(
                        reverse: true,
                        children: snapshot.data.documents.reversed
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
                                  document['message'],
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
                  icon: Icon(Icons.camera_alt),
                  iconSize: 30,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
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
                  onPressed: () async {
                    await _ref.add({
                      'sender_name': _auth.currentUser.email,
                      'sender_id': widget.userId,
                      'message': _editingController.text,
                      'timeStamp': DateTime.now(),
                    });
                    _editingController.text = '';
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