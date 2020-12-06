import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../signIn/entryPage.dart';
import 'homeCard1.dart' as homeCard1;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  bool isSearching = false;

  final List<Tab> myTabs = <Tab>[
    Tab(text: "food"),
    Tab(text: "books"),
    Tab(text: "clothes"),
    Tab(text: "techs"),

  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            homeCard1.homeCard1(),
            homeCard1.homeCard1(),
            homeCard1.homeCard1(),
            homeCard1.homeCard1(),

          ]
      ),
      appBar: AppBar(
        title: !isSearching
            ? Text('')
            : TextField(
                 decoration: InputDecoration(
                 hintText: 'Search for items...'),

        ),



        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          tabs: myTabs,

        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          color: Colors.teal,
          icon: Icon(Icons.location_on, size: 25.0,),

        ),
        actions: <Widget>[
          isSearching ?
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.cancel),
              iconSize: 30.0,
              onPressed: () {
                setState(() {
                  this.isSearching = false;
                });
              }
          )
          : IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              iconSize: 40.0,
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              }
          ),
          ],

      ),
    );

  }
}
