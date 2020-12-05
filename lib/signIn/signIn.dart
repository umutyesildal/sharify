import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'SmsCode.dart';
import 'signUp.dart';

class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Image(
                image: AssetImage('assets/sharifyLogo.png'),
                width: 124.0,
                height: 62.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text('Sign in',
                    style: TextStyle(
                      fontSize: 28.0,
                    )),
                Text(
                  '     to share.',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                newTextField(
                  givenText: 'E-mail Address',
                ),
                newTextField(
                  givenText: 'Password',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: newButton(
                givenButton: 'SIGN IN',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: new Text(
                    "Don’t you have an account?",
                    style: TextStyle(color: Colors.teal[700]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class newButton extends StatelessWidget {
  const newButton({@required this.givenButton});
  final String givenButton;

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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigator()),
          ),
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

class newTextField extends StatelessWidget {
  const newTextField({@required this.givenText});
  final String givenText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: givenText,
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
