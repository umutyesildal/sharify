import 'package:flutter/material.dart';
import 'Forum/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Forum/constants.dart';
import 'onBoarding/onBoarding.dart';
import 'package:sharify/signIn/signIn.dart';
import 'package:sharify/signIn/signUp.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kbackgroundWhite,
        accentColor: kalphaGreen,
        scaffoldBackgroundColor: kbackgroundGrey,
      ),
      home: Splash(),
      initialRoute: "/",
      routes: {
        "/signin": (context) => SignIn(),
        "/signup": (context) => SignUp(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  SpinKitSquareCircle spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = SpinKitSquareCircle(
      color: kalphaGreen,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
    );

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => new onBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinkit,
            SizedBox(
              height: 25,
            ),
            Text(
              "Sharify"),
          ],
        ),
      ),
    );
  }
}