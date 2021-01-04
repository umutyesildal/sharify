import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'add_page.dart';
import 'package:sharify/HomePage/addTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

/// adding food to database
class addFood extends StatefulWidget {
  @override
  _addFoodState createState() => _addFoodState();
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;
}

class _addFoodState extends State<addFood> {
  // text editing controllers to control and initialize the data inside textformfields(textfields).
  TextEditingController titleOfItem = TextEditingController();
  TextEditingController descriptionOfItem = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController pickUpTimes = TextEditingController();
  TextEditingController location = TextEditingController();
  String userName;
  String imageURL;

  /// Getting username from userID
  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(addFood.uid)
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

  void initState() {
    super.initState();
    giver();
  }

  /// used for custom circular indicator.
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
          'Share a food',
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
              /// Adding the food to database.
              onPressed: () async {
                pr.show();
                await FirebaseFirestore.instance.collection('items').add(
                  {
                    "photo": imageURL,
                    "header": titleOfItem.text,
                    "quantity": quantity.text,
                    "expiryDate": expiryDate.text,
                    "pickUpTimes": pickUpTimes.text,
                    "location": location.text,
                    "tag": "food",
                    "username": userName,
                    "userUID": addFood.uid,
                    "description": descriptionOfItem.text,
                  },
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigator()));
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
                addTextField(
                  controller: quantity,
                  givenIcon: Icon(
                    Icons.format_list_numbered,
                    color: Colors.black,
                  ),
                  givenText: "Quantity",
                ),
                addTextField(
                  controller: expiryDate,
                  givenIcon: Icon(
                    Icons.update,
                    color: Colors.black,
                  ),
                  givenText: "Expiry Date",
                ),
                addTextField(
                  controller: pickUpTimes,
                  givenIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                  givenText: "Pick-Up Times",
                ),
                addTextField(
                  controller: location,
                  givenIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  givenText: "Location",
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
