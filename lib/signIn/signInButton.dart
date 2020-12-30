import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:sharify/onBoarding/onBoarding.dart';
import 'package:sharify/signIn/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_dialog/progress_dialog.dart';

class signInButton extends StatefulWidget {
  const signInButton(
      {@required this.givenButton, this.givenEmail, this.givenPassword});

  final String givenButton;
  final String givenEmail;
  final String givenPassword;
  static final _auth = FirebaseAuth.instance;

  @override
  _signInButtonState createState() => _signInButtonState();
}

class _signInButtonState extends State<signInButton> {
  ProgressDialog pr;
  SignIn signIn = new SignIn();
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
          color: Colors.teal[700],
          child: Center(
            child: Text(
              widget.givenButton,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () async {
            pr.show();
            print("gösterildi");
            try {
              print(widget.givenPassword);
              print(widget.givenEmail);
              final user = await signInButton._auth.signInWithEmailAndPassword(
                  email: widget.givenEmail.trim(),
                  password: widget.givenPassword.trim());
              final uid = await user.user.uid;
              var result = await FirebaseFirestore.instance
                  .collection('users')
                  .where('userUID', isEqualTo: uid)
                  .get();
              result.docs.forEach(
                (element) {
                  print(element.data());
                  if (element.data()["onboardingPass"] == false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => onBoarding()));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => navigator()),
                    );
                  }
                },
              );
            } catch (e) {
              print(e);
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
