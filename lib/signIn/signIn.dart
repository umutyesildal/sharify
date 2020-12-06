import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:sharify/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
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
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "E-mail Adress",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
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
        ),
      ),
    );
  }
}

class newButton extends StatelessWidget {
  const newButton(
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
              final user = await _auth.signInWithEmailAndPassword(email: givenEmail, password: givenPassword);
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


