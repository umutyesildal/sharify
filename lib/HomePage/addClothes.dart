import 'package:flutter/material.dart';
import 'add_page.dart';
import 'navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

/// adding clothes to database
class addClothes extends StatefulWidget {
  @override
  _addClothesState createState() => _addClothesState();
  // a code block to get current users user id.
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;
}

class _addClothesState extends State<addClothes> {
  // text editing controllers to control and initialize the data inside textformfields(textfields).
  TextEditingController titleOfItem = TextEditingController();
  TextEditingController descriptionOfItem = TextEditingController();
  TextEditingController pickUpTimes = TextEditingController();
  TextEditingController location = TextEditingController();
  String ddvalue = 'Category';
  String ddvalue2 = 'Gender';
  String ddvalue3 = 'Size';
  String userName;
  // this is an imageURL so that we can save url to database.
  String imageURL;

  /// Getting username from userID
  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(addClothes.uid)
        .get();

    userName = result.data()['userName'];
    print(result.data()['userName']);
  }

  /// function to upload image.
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
// upload image
      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child('clothItem/${DateTime.now().toString()}')
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

  void initState() {
    super.initState();
    giver();
  }

  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Wait',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Share a cloth',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addPage()));
          },
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              // att items to database.
              onPressed: () async {
                pr.show();
                try {
                  await FirebaseFirestore.instance.collection('items').add(
                    {
                      "date": DateTime.now().toString().substring(0, 16),
                      "photo": imageURL,
                      "header": titleOfItem.text,
                      "pickUpTimes": pickUpTimes.text,
                      "location": location.text,
                      "tag": "cloth",
                      "username": userName,
                      "userUID": addClothes.uid,
                      "category": ddvalue,
                      "gender": ddvalue2,
                      "size": ddvalue3,
                      "description": descriptionOfItem.text,
                    },
                  );
                  await showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: new Text('Success'),
                      content: Text("Successfully Added!"),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        navigator())); // dismisses only the dialog and returns nothing
                          },
                          child: new Text('OK'),
                        ),
                      ],
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleOfItem,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '  Title of Item',
                    hintStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                  ),
                ),
                TextFormField(
                  controller: descriptionOfItem,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '     Description of Item',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    controller: pickUpTimes,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: ' Pick-up Times',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    child: TextFormField(
                      controller: location,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: ' Location',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: ddvalue,
                    dropdownColor: Colors.green,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        ddvalue = newValue;
                      });
                    },
                    items: <String>[
                      'Category',
                      'None',
                      'Jacket',
                      'Jeans and short',
                      'Dress',
                      'Shoes',
                      'T-shirt and sweatshirt'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: ddvalue2,
                    dropdownColor: Colors.green,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        ddvalue2 = newValue;
                      });
                    },
                    items: <String>['Gender', 'None', 'Female', 'Male']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: ddvalue3,
                    dropdownColor: Colors.green,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        ddvalue3 = newValue;
                      });
                    },
                    items: <String>['Size', 'S', 'M', 'L']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 170.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      uploadImage();
                    },
                    child: CircleAvatar(
                      // when image is added to database image will load up here
                      backgroundImage: (imageURL != null)
                          ? NetworkImage(imageURL)
                          : AssetImage("assets/tapHere.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
