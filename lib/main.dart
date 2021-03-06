import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sharify/signIn/entryPage.dart';
import 'constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sharify/services/authService.dart';

/// Because the app needs to connect to firebase we do that at the start of the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: kbackgroundWhite,
          accentColor: kalphaGreen,
          scaffoldBackgroundColor: kbackgroundGrey,
        ),
        home: Splash(),
      ),
    );
  }
}

/// splash art
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
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => new entryPage()));
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
            Image.asset(
              'assets/sharifyLogo.png',
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sharify",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'SFProText-Semibold',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
