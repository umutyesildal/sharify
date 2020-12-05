import 'package:flutter/material.dart';
import 'signup.dart';
import 'SmsCode.dart';
import 'signIn.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
      initialRoute: "/",
      routes: {
        "/signin": (context) => SignIn(),
        "/signup": (context) => SignUp(),
        "/smscode": (context) => SmsCode(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                image: AssetImage('images/logo.png'),
                width: 124.0,
                height: 62.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text('     Welcome',
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
            flex: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  height: 70.0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2.0),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: new Image(
                          image: new AssetImage("images/apple.png"),
                          color: null,
                          width: 22.49,
                          height: 27.71,
                        )),
                        SizedBox(
                          width: 10.0,
                        ),
                        Center(
                          child: Text(
                            ' Sign in with Apple',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  height: 70.0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Image(
                          image: new AssetImage("images/search.png"),
                          color: null,
                          width: 22.49,
                          height: 27.71,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Center(
                          child: Text(
                            ' Sign in with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  height: 70.0,
                  child: Container(
                    child: FlatButton(
                      child: Center(
                        child: Text(
                          "Sign in with mail",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.green,
                          style: BorderStyle.solid,
                          width: 2.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  child: Center(
                    child: Text(
                      'Having trouble with login?',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ],
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
            MaterialPageRoute(builder: (context) => SmsCode()),
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
