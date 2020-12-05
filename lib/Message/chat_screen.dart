import 'package:flutter/material.dart';
import 'models/message_model.dart';
import 'models/user_model.dart';
import 'constants.dart';

String message;

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe //kullanıcıya göre mesaj'ın tarafı değişiyor
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8, right: 80),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: isMe
            ? Colors.grey.shade100
            : Colors.green
                .shade50, //kullanıcıya göre mesaj kutusunun köşesi sağ veya sol oluyor
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: kSFProTextRegular.copyWith(
                color: kLightGrayColor, fontSize: 13),
          ),
          SizedBox(height: 7),
          Text(
            message.text,
            style: kSFProTextRegular,
          ),
        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
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
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {
              message = value;
            },
            decoration: InputDecoration.collapsed(
              hintText: 'Mesaj Gönder...',
            ),
          ),
        ),
        IconButtonWidget(
          icon: Icon(Icons.send),
          iconSize: 30,
          onPressed: () {
            print(message);
          },
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              widget.user.name,
              style: kSFProTextMedium,
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
            _buildMessageComposer(),
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
