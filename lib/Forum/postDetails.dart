import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'imageDialog.dart';

/// a detailed version of postCard, It is enabled when postCard is tapped.
class postDetails extends StatefulWidget {
  const postDetails(
      {@required this.forumHeader,
      this.forumDate,
      this.forumContentText,
      this.forumContentPhoto,
      this.forumPersonSharing});

  final String forumHeader;
  final DateTime forumDate;
  final String forumContentText;
  final String forumContentPhoto;
  final String forumPersonSharing;

  @override
  _postDetailsState createState() => _postDetailsState();
}

class _postDetailsState extends State<postDetails> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
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
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.forumHeader,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.forumDate.toString().substring(0, 16),
                    style: TextStyle(fontSize: 10.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.forumContentText +
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.forumContentPhoto),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (_) => ImageDialog(
                            sentPhoto: widget.forumContentPhoto,
                          ));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        /*   Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage("widget.forumPaylasanFoto"),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ), */
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 9,
                          child: Text(
                            widget.forumPersonSharing,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*    Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.favorite,
                            size: 12,
                            color: klikeAndCommentGrey,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              widget.forumBegeni,
                              style: TextStyle(
                                  fontSize: 12, color: klikeAndCommentGrey),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.comment,
                            size: 12,
                            color: klikeAndCommentGrey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.forumYorum,
                            style: TextStyle(
                                fontSize: 12, color: klikeAndCommentGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  */
                ],
              ),
            ),
            /*    Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => fullCommentPage()),
                    );
                  },
                  child: Text(
                    "Replies (200)",
                    style: TextStyle(
                      color: kForumRepliesGrey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                itemExtent: 150,
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  commentCard(
                    commentatorName: "Halil Akkanat",
                    commentatorComment:
                        "Bu kermese katılmayı gerçekten çok isterim !",
                    commentatorDate: DateTime.now().toString(),
                    commentatorPhoto: "assets/HalilAkkanat.jpg",
                  ),
                ],
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
