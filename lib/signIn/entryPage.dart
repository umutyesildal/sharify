import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class entryPage extends StatefulWidget {
  @override
  _entryPageState createState() => new _entryPageState();
}

class _entryPageState extends State<entryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
      await _auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("${user.displayName}, Google ile giriş yaptı."),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => navigator(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.message}"),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Google ile giriş yaparken bir hata oluştu!"),
        ),
      );
    }
  }



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
                Text('    Welcome',
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
                              image: new AssetImage("assets/apple.png"),
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
                Builder(
                  builder: (context) => FlatButton(
                    onPressed: () async => _signInWithGoogle(),
                    child: Container(
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
                              image: new AssetImage("assets/search.png"),
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
                      onPressed: () =>
                          Navigator.push(
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
