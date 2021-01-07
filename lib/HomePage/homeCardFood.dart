import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharify/Message/chat_screen.dart';
import 'package:sharify/Message/new_conversation.dart';
import 'package:sharify/Message/recent_chats.dart';
import 'package:sharify/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharify/Forum/imageDialog.dart';

/// the detailed card for homecard1, and the tag is food
class homeCardFood extends StatefulWidget {
  bool isExpanded = false;

  homeCardFood({
    @required this.header,
    this.userUID,
    this.userSenderName,
    this.photo,
    this.location,
    this.pickUpTimes,
    this.expiryDate,
    this.quantity,
    this.description,
    this.date,
  });
  final String date;
  final String header;
  final String userUID;
  final String userSenderName;
  final String photo;
  final String location;
  final String pickUpTimes;
  final String expiryDate;
  final String quantity;
  final String description;

  // a code block to get current users user id.
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;

  @override
  _homeCardFoodState createState() => _homeCardFoodState();
}

class _homeCardFoodState extends State<homeCardFood> {
  /// The function to get current users data from database and saving it to a string.
  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(homeCardFood.uid)
        .get();

    userName = result.data()['userName'];
    userPhoto = result.data()['userPhoto'];
    userUID = result.data()['userUID'];

    setState(() {
      // when it is no longer waiting for a response, it returns not the circular indicator but it returns scaffold.
      isLoading = true;
    });
  }

  String userUID;
  String userName;
  String userPhoto;
  // to check if awaiting response has came or not.
  bool isLoading = false;

  void initState() {
    super.initState();
    giver();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Card(
          elevation: 0.0, //Because this is a card there is a basic elevation.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Go Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.header,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.date.substring(0, 16),
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    new ConstrainedBox(
                        constraints: widget.isExpanded
                            ? new BoxConstraints()
                            : new BoxConstraints(maxHeight: 50.0),
                        child: new Text(
                          widget.description,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                    widget.isExpanded
                        ? new Container()
                        : new FlatButton(
                            child: const Text(
                              'See more...',
                              style: TextStyle(
                                color: kalphaGreen,
                                fontSize: 15.0,
                              ),
                            ),
                            onPressed: () =>
                                setState(() => widget.isExpanded = true))
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                          sentPhoto: widget.photo,
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 4 / 5,
                      height: MediaQuery.of(context).size.height * 75 / 203,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: NetworkImage(widget.photo),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /*
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            */
              SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: new AssetImage("assets/placeholder.png"),
                            color: null,
                            width: 20.49,
                            height: 25.71,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            widget.location,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: new AssetImage("assets/clock.png"),
                            color: null,
                            width: 20.49,
                            height: 25.71,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            widget.pickUpTimes,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: new AssetImage("assets/hashtag.png"),
                            color: null,
                            width: 20.49,
                            height: 25.71,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            widget.quantity,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 5,
                            child: Text(
                              widget.userSenderName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 30.0),
                            child: Expanded(
                              flex: 5,
                              child: Container(
                                child: FlatButton(
                                  onPressed: () {
                                    newConversation(userUID, widget.userUID); // first one ise current user second one is the post owner
                                    openChat(context, userUID, widget.userUID) ;
                                  },
                                  height: 10.0,
                                  child: Center(
                                    child: Text(
                                      "Send Message",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: kalphaGreen,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
