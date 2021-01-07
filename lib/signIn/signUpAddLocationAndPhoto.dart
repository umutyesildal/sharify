import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:sharify/onBoarding/onBoarding.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Adding photo and location to user.
class signUpAddLocationAndPhoto extends StatefulWidget {
  @override
  _signUpAddLocationAndPhotoState createState() =>
      _signUpAddLocationAndPhotoState();
// a code block to get current users user id.
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;
}

class _signUpAddLocationAndPhotoState extends State<signUpAddLocationAndPhoto> {
  String _selectedItem;
  // this is an imageURL so that we can save url to database.
  String imageURL;
  ProgressDialog pr;

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

      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child('userProfilePhotos/${signUpAddLocationAndPhoto.uid}')
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

  void inputData(String location, String imageURL) async {
    var data = {
      "location": location,
      "userPhoto": imageURL,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(signUpAddLocationAndPhoto.uid)
        .update(data);
    final map = await FirebaseFirestore.instance
        .collection('users')
        .doc(signUpAddLocationAndPhoto.uid);
    print(map);
    // here you write the codes to input the data into firestore
  }

  Widget build(BuildContext context) {
    /// used for custom circular indicator.
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
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Image(
                    image: AssetImage('assets/sharifyLogo.png'),
                    width: 124.0,
                    height: 62.0,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add Photo',
                          style: TextStyle(
                            fontSize: 28.0,
                          )),
                      Text(
                        'and Location',
                        style: TextStyle(
                          fontSize: 28.0,
                        ),
                      ),
                      Text(
                        'to continue.',
                        style: TextStyle(
                          fontSize: 28.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () => uploadImage(),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 75,

                        /// if imageURL is null stock image, if not added image.
                        backgroundImage: (imageURL != null)
                            ? NetworkImage(imageURL)
                            : AssetImage("assets/tapHere.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all()),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: _selectedItem,
                          items: [
                            DropdownMenuItem(
                              child: Text("İstanbul/Avrupa"),
                              value: "İstanbul/Avrupa",
                            ),
                            DropdownMenuItem(
                              child: Text("İstanbul/Anadolu"),
                              value: "İstanbul/Anadolu",
                            ),
                            DropdownMenuItem(
                                child: Text("Kocaeli"), value: "Kocaeli"),
                            DropdownMenuItem(
                                child: Text("Edirne"), value: "Edirne")
                          ],
                          onChanged: (value) {
                            setState(
                              () {
                                _selectedItem = value;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    height: 60.0,
                    child: Container(
                      child: FlatButton(
                        color: Colors.teal[700],
                        child: Center(
                          child: Text(
                            "DONE",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        /// adding image and location to userDatabase
                        onPressed: () async {
                          pr.show();
                          try {
                            print(_selectedItem);
                            print(imageURL);
                            if (imageURL == null) {
                              await showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  title: new Text('Error'),
                                  content: Text("Please uploa Profile Picture"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(); // dismisses only the dialog and returns nothing
                                      },
                                      child: new Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else if (_selectedItem == null) {
                              await showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  title: new Text('Error'),
                                  content: Text("please select a location"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(); // dismisses only the dialog and returns nothing
                                      },
                                      child: new Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              await inputData(_selectedItem, imageURL);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => onBoarding()),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.teal[700],
                            style: BorderStyle.solid,
                            width: 2.0),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// custom textfield
class customTextField extends StatelessWidget {
  const customTextField({@required this.givenText});
  final String givenText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.teal[700],
            ),
          ),
          labelText: givenText,
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
