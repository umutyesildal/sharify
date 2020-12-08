import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/HomePage/navigator.dart';

class signUpButton extends StatelessWidget {
  const signUpButton(
      {@required this.givenButton, this.givenEmail, this.givenPassword});

  final String givenButton;
  final String givenEmail;
  final String givenPassword;
  static final _auth = FirebaseAuth.instance;
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
              final user = await _auth.createUserWithEmailAndPassword(email: givenEmail, password: givenPassword);
              if(user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigator()),
                );
              }
            }catch(e){
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
