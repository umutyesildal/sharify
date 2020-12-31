import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeCardTech extends StatefulWidget {
  const homeCardTech(
      {@required this.header,
      this.userName,
      this.userUID,
      this.photo,
      this.location,
      this.pickUpTimes,
      this.expiryDate,
      this.quantity});

  final String header;
  final String expiryDate;
  final String location;
  final String photo;
  final String pickUpTimes;
  final String quantity;
  final String userUID;
  final String userName;

  @override
  _homeCardTechState createState() => _homeCardTechState();
}

class _homeCardTechState extends State<homeCardTech> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Card(
        elevation: 0.0, //Because this is a card there is a basic elevation.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Go Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.header,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.location,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 9,
                          child: Text(
                            widget.userName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
