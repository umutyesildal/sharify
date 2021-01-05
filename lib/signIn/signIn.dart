import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';
import 'signInButton.dart';
import 'package:sharify/signIn/signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // text editing controllers to control and initialize the data inside textformfields(textfields).
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
                flex: 1,
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "E-mail Adress",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: passwordController,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),

                  /// The button in order to sign the user in
                  child: signInButton(
                    givenEmail: emailController.text,
                    givenPassword: passwordController.text,
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
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SignUp()));
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
