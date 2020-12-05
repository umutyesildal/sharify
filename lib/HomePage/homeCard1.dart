import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeCard1 extends StatefulWidget {
  @override
  _homeCard1State createState() => _homeCard1State();
}

class _homeCard1State extends State<homeCard1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(30, (index){
         return Card(
            elevation: 10.0,
            margin: EdgeInsets.all(25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0 )
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/yemek1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              ),
         );

        }
        ),
      ),

      );

  }
}


