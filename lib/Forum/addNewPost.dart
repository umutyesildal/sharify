import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addNewPost extends StatefulWidget {
  @override
  _addNewPostState createState() => _addNewPostState();
}

class _addNewPostState extends State<addNewPost> {
  TextEditingController titlePostController = TextEditingController();
  TextEditingController contentPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "New Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text('Post'),
                      color: kalphaGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.white,
                      onPressed: () async {
                        print(titlePostController.text);
                        print(contentPostController.text);
                        FirebaseFirestore.instance.collection('forum').add({
                          "header": titlePostController.text,
                          "contnent": contentPostController.text,
                          "date": DateTime.now().toString().substring(0, 16),
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage("assets/happyMan.jpg"),
                      backgroundColor: Colors.transparent,
                    )),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: titlePostController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title of Post',
                        hintStyle: TextStyle(
                            fontSize: 20.0, color: klikeAndCommentGrey),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: contentPostController,
                      maxLength: 300,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: 'Write your post',
                        hintStyle: TextStyle(
                            fontSize: 17.0, color: klikeAndCommentGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 4 / 5,
                    height: MediaQuery.of(context).size.height * 75 / 203,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage("assets/forumFoto.png"),
                      ),
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
