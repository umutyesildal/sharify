import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';

/// the item card in homepage
class homeCard1 extends StatefulWidget {
  const homeCard1(
      {@required this.givenPhoto, this.givenHeader, this.givenFullName});
  final String givenPhoto;
  final String givenHeader;
  final String givenFullName;

  @override
  _homeCard1State createState() => _homeCard1State();
}

class _homeCard1State extends State<homeCard1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                    image: NetworkImage(widget.givenPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.givenHeader,
                style: TextStyle(
                  color: kbetaGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(widget.givenFullName)),
          ),
        ],
      ),
    );
  }
}
