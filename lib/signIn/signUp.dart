import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';
import 'package:sharify/signIn/signIn.dart';
import 'package:sharify/signIn/signUpButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // text editing controllers to control and initialize the data inside textformfields(textfields).
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                          fontSize: 28,
                        )),
                    Text(
                      '     to share.',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 3.0, 25.0, 5.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                      child: TextFormField(
                        maxLength: 11,
                        controller: phoneController,
                        decoration: textFieldDecoration.copyWith(
                          labelText: "Phone Number",
                          counterText: '',
                          counterStyle: TextStyle(fontSize: 0),
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
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
                      padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 3.0),
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
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),

                  /// to create a user with given datas.
                  child: signUpButton(
                    givenUserName: nameController.text,
                    givenUserPhone: phoneController.text,
                    givenEmail: emailController.text,
                    givenPassword: passwordController.text,
                    givenButton: 'SIGN UP',
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
                                builder: (context) => new SignIn()));
                      },
                      child: new Padding(
                        padding: new EdgeInsets.all(8.0),
                        child: new Text(
                          "You’ve already registered?",
                          style: TextStyle(color: Colors.teal[700]),
                        ),
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
