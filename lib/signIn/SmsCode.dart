import 'package:flutter/material.dart';
import 'package:sharify_2/HomePage/navigator.dart';
import 'signUp.dart';

class SmsCode extends StatelessWidget {
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
                image: AssetImage('images/sharifyLogo.png'),
                width: 124.0,
                height: 62.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text('     Please validate',
                    style: TextStyle(
                      fontSize: 28.0,
                    )),
                Text(
                  '  your account',
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
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                newTextField(
                  givenText: 'SMS CODE',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: newButton(
                givenButton: 'CHECK',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text(
                      "You’ve already registered?",
                      style: TextStyle(color: Colors.teal[700]),
                    ),
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
