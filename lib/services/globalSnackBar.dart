import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';

class GlobalSnackBar {
  final String message;

  const GlobalSnackBar({
    @required this.message,
  });

  static show(
      BuildContext context,
      String message,
      ) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        elevation: 0.0,
        backgroundColor: kalphaGreen,
        //behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: new Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        //backgroundColor: Colors.redAccent,
        action: SnackBarAction(
          textColor: Color(0xFFFAF2FB),
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }
}