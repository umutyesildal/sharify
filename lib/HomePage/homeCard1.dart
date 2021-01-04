import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.all(25.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.givenPhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(widget.givenHeader)),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(widget.givenFullName)),
          ),
        ],
      ),
    );
  }
}
