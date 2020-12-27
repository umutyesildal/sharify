import 'package:flutter/material.dart';

class addTextField extends StatelessWidget {
  const addTextField({
    @required this.givenIcon,
    this.givenText,
  });
  final Icon givenIcon;
  final String givenText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: TextField(
        decoration: InputDecoration(
          icon: givenIcon,
          border: InputBorder.none,
          hintText: givenText,
          hintStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
