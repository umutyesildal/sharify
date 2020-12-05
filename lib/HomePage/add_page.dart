import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'homePage.dart';

class addPage extends StatefulWidget {
  @override
  _addPageState createState() => _addPageState();
}

class _addPageState extends State<addPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Share',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigator()));
          },
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '   Choose a Category',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 37.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '   to share.',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 37.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/add.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'food',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/add.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'books',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/add.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'clothes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/add.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'techs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
