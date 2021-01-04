import 'package:flutter/material.dart';

/// This textfield is widely used in addPages so we refactored it to use it more than once.
class addTextField extends StatelessWidget {
  const addTextField(
      {@required this.givenIcon, this.givenText, this.controller});
  final Icon givenIcon;
  final String givenText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: TextField(
        controller: controller,
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
