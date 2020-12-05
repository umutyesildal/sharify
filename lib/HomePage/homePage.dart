import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeCard1.dart' as homeCard1;





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar;
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
          IconButton(
              color: Colors.black,
              icon: cusIcon,
              iconSize: 40.0,
              onPressed: (){
                setState(() {
                  if(this.cusIcon.icon == Icons.search){
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ('Search for items...'),
                      ),
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.0,
                      ),
                    );
                  }
                  else{
                    this.cusIcon = Icon(Icons.search);
                  }
                });
              }
          )
        ],

      ),
    );

  }
}
