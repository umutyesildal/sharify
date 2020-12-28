import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUpButton extends StatelessWidget {
  const signUpButton(
      {@required this.givenButton,
      this.givenEmail,
      this.givenPassword,
      this.givenUserName,
      this.givenUserPhone});

  final String givenUserPhone;
  final String givenUserName;
  final String givenButton;
  final String givenEmail;
  final String givenPassword;
  static final _auth = FirebaseAuth.instance;

  void inputData() {
    final User user = _auth.currentUser;
    final uid = user.uid;
    FirebaseFirestore.instance.collection('users').add({
      "userUID": uid,
      "userName": givenUserName,
      "userPhone": givenUserPhone,
    });
    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      height: 60.0,
      child: Container(
        child: FlatButton(
          color: Colors.teal[700],
          child: Center(
            child: Text(
              givenButton,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () async {
            try {
              print(givenPassword);
              print(givenEmail);
              final user = await _auth.createUserWithEmailAndPassword(
                  email: givenEmail, password: givenPassword);
              inputData();
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigator()),
                );
              }
            } catch (e) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(e),
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
