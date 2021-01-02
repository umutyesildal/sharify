import 'package:flutter/material.dart';
import 'package:sharify/Forum/forumTabs.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class addNewPost extends StatefulWidget {
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;

  @override
  _addNewPostState createState() => _addNewPostState();
}

class _addNewPostState extends State<addNewPost> {
  TextEditingController titlePostController = TextEditingController();
  TextEditingController contentPostController = TextEditingController();
  String imageURL;

  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(addNewPost.uid)
        .get();

    userName = result.data()['userName'];
    userPhoto = result.data()['userPhoto'];
    print(result.data()['userName']);
    print(result.data()['userName']);

    print(userPhoto);
    setState(() {
      isLoading = true;
    });
  }

  void uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    await Permission.photos.request();

    // check permission
    var permissionStatus = await Permission.photos.status;
    //select image
    if (permissionStatus.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child('foodItem/${DateTime.now().toString()}')
            .putFile(file);

        var downloadURL = await snapshot.ref.getDownloadURL();
        print("ŞİMDİ DOWNLOAD URL GELCEK");
        print(downloadURL);

        setState(() {
          imageURL = downloadURL;
        });
      } else {
        print("No Image is selected");
      }
    } else {
      print("Grant Permission");
    }
  }

  String userPhoto;
  String userName;
  bool isLoading = false;

  void initState() {
    super.initState();
    giver();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    if (isLoading == false) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
                          await FirebaseFirestore.instance
                              .collection('forum')
                              .add(
                            {
                              "header": titlePostController.text,
                              "content": contentPostController.text,
                              "date":
                                  DateTime.now().toString().substring(0, 16),
                              "contentPhoto": imageURL,
                              "userName": userName,
                              "userUID": addNewPost.uid,
                            },
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forumTabs()));
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
                      backgroundImage: NetworkImage(userPhoto),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
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
                    GestureDetector(
                      onTap: () {
                        uploadImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: MediaQuery.of(context).size.height * 75 / 203,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: (imageURL != null)
                                ? NetworkImage(imageURL)
                                : AssetImage("assets/tapHere.png"),
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
      );
    }
  }
}
