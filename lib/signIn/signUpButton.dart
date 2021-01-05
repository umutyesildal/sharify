import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'signUpAddLocationAndPhoto.dart';

/// Signing the user up.
class signUpButton extends StatefulWidget {
  const signUpButton(
      {@required this.givenButton,
      this.givenEmail,
      this.givenPassword,
      this.givenUserName,
      this.givenUserPhone,
      this.givenColor});

  final String givenUserPhone;
  final String givenUserName;
  final String givenButton;
  final String givenEmail;
  final String givenPassword;
  final Color givenColor;
  static final _auth = FirebaseAuth.instance;

  @override
  _signUpButtonState createState() => _signUpButtonState();
}

class _signUpButtonState extends State<signUpButton> {
  /// adding user datas to database with a document id same with user id.
  void inputData() async {
    final User user = signUpButton._auth.currentUser;
    final uid = user.uid;
    var data = {
      "userMail": widget.givenEmail,
      "userUID": uid,
      "userName": widget.givenUserName,
      "userPhone": widget.givenUserPhone,
      "onboardingPass": false,
    };
    await FirebaseFirestore.instance.collection('users').doc(uid).set(data);
    final map = await FirebaseFirestore.instance.collection('users').doc(uid);
    print(map);
    // here you write the codes to input the data into firestore
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
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      height: 60.0,
      child: Container(
        child: FlatButton(
          color: widget.givenColor,
          child: Center(
            child: Text(
              widget.givenButton,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          /// creating a user with authentication and creating an another user at database with the user id from auth.
          onPressed: () async {
            pr.show();
            print("gösterildi");
            try {
              print(widget.givenPassword);
              print(widget.givenEmail);
              final user = await signUpButton._auth
                  .createUserWithEmailAndPassword(
                      email: widget.givenEmail, password: widget.givenPassword);
              print("okay");
              inputData();
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => signUpAddLocationAndPhoto()),
                );
              }
            } catch (e) {
              print(e);
              await showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                  title: new Text('Error'),
                  content: Text(e.toString()),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop(); // dismisses only the dialog and returns nothing
                      },
                      child: new Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.teal[700], style: BorderStyle.solid, width: 2.0),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
