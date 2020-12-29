import 'package:flutter/material.dart';
import 'add_page.dart';

class addClothes extends StatefulWidget {
  @override
  _addClothesState createState() => _addClothesState();
}

class _addClothesState extends State<addClothes> {
  String ddvalue = 'Category';
  String ddvalue2 = 'Gender';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Share a clothes',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addPage()));
          },
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '  Title of Item',
                    hintStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '     Description of Item',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today, color: Colors.black,),
                      border: InputBorder.none,
                      hintText: ' Pick-up Times',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.location_on_outlined, color: Colors.black,),
                        border: InputBorder.none,
                        hintText: ' Location',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: ddvalue,
                      dropdownColor: Colors.green,
                      icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    onChanged: (String newValue) {
                      setState(() {
                        ddvalue = newValue;
                      });
                    },
                    items: <String>['Category','None','Jacket', 'Jeans and short', 'Dress','Shoes', 'T-shirt and sweatshirt']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    ),
                  ),

                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: ddvalue2,
                      dropdownColor: Colors.green,
                      icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    onChanged: (String newValue) {
                      setState(() {
                        ddvalue2= newValue;
                      });
                    },
                    items: <String>[ 'Gender','None','Female','Male']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    ),
                  ),

                SizedBox(height: 20.0,),
                Container(
                  height: 170.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'You can add total 10 photos.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                        fontSize: 21.0,
                      ),),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );



  }
}
