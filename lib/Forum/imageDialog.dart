import 'package:flutter/material.dart';

/// to create a function that shows the sent photo bigger.
class ImageDialog extends StatelessWidget {
  const ImageDialog({@required this.sentPhoto});
  final String sentPhoto;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 4 / 5,
        height: MediaQuery.of(context).size.height * 75 / 203,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            fit: BoxFit.scaleDown,
            image: NetworkImage(sentPhoto),
          ),
        ),
      ),
    );
  }
}
