import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:sharify/services/globalSnackBar.dart';
import 'package:sharify/signIn/signIn.dart';
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
  SignIn signIn = new SignIn();
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
              widget.givenButton,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () async {
            try {
              print(widget.givenPassword);
              print(widget.givenEmail);
              final user = await signInButton._auth.signInWithEmailAndPassword(email: widget.givenEmail.trim(), password: widget.givenPassword.trim());
              if(user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigator()),
                );
              }
            }catch(e){
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
