import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharify/HomePage/addBook.dart';
import 'package:sharify/HomePage/addFood.dart';
import 'package:sharify/HomePage/addTechs.dart';
import 'package:sharify/HomePage/navigator.dart';
import 'package:sharify/HomePage/addClothes.dart';

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
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addFood()));
              },
              child: Container(
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
                    Text(
                      'food',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addBook()));
              },
              child: Container(
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
                    Text(
                      'books',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addClothes()));
              },
              child: Container(
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
                    Text(
                      'clothes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addTechs()));
              },
              child: Container(
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
                    Text(
                      'techs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
