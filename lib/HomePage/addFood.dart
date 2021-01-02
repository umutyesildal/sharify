import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'add_page.dart';
import 'package:sharify/HomePage/addTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';

class addFood extends StatefulWidget {
  @override
  _addFoodState createState() => _addFoodState();
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;
}

class _addFoodState extends State<addFood> {
  TextEditingController titleOfItem = TextEditingController();
  TextEditingController descriptionOfItem = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController pickUpTimes = TextEditingController();
  TextEditingController location = TextEditingController();
  String userName;
  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(addFood.uid)
        .get();

    userName = result.data()['userName'];
    print(result.data()['userName']);
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
              onPressed: () {
                pr.show();
                FirebaseFirestore.instance.collection('items').add(
                  {
                    "photo": "",
                    "header": titleOfItem.text,
                    "quantity": quantity.text,
                    "expiryDate": expiryDate.text,
                    "pickUpTimes": pickUpTimes.text,
                    "location": location.text,
                    "tag": "food",
                    "username": userName,
                    "userUID": addFood.uid,
                    "description": descriptionOfItem,
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
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'You can add total 10 photos.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                        fontSize: 21.0,
                      ),
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
