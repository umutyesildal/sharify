import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:sharify/HomePage/homeCard1.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharify/HomePage/homeCardBook.dart';
import 'package:sharify/HomePage/homeCardFood.dart';
import 'package:sharify/HomePage/homeCardCloth.dart';
import 'package:sharify/HomePage/homeCardTech.dart';
import 'package:animations/animations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
          Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('items')
                  .where("tag", isEqualTo: "food")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.red,
                    ),
                  );
                }
                print(snapshot.data);
                final QuerySnapshot querySnapshot = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  children: List.generate(
                    querySnapshot.docs.length,
                    (index) {
                      return OpenContainer(
                        openElevation: 0.0,
                        closedElevation: 0.0,
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: const Duration(milliseconds: 1000),
                        useRootNavigator: true,
                        closedBuilder:
                            (BuildContext context, VoidCallback openContainer) {
                          final map = querySnapshot.docs[index].data();
                          return homeCard1(
                            givenPhoto: map['photo'],
                            givenFullName: map['username'],
                            givenHeader: map['header'],
                          );
                        },
                        openBuilder: (BuildContext context, VoidCallback _) {
                          final map = querySnapshot.docs[index].data();
                          return homeCardFood(
                            header: map['header'],
                            userUID: "userUID",
                            expiryDate: map['expiryDate'],
                            location: map['location'],
                            photo: map['photo'],
                            pickUpTimes: map['pickUpTimes'],
                            quantity: map['quantity'],
                            description: map['description'],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('items')
                  .where("tag", isEqualTo: "book")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.red,
                    ),
                  );
                }
                print(snapshot.data);
                final QuerySnapshot querySnapshot = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  children: List.generate(
                    querySnapshot.docs.length,
                    (index) {
                      return OpenContainer(
                        openElevation: 0.0,
                        closedElevation: 0.0,
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: const Duration(milliseconds: 1000),
                        useRootNavigator: true,
                        closedBuilder:
                            (BuildContext context, VoidCallback openContainer) {
                          final map = querySnapshot.docs[index].data();
                          return homeCard1(
                            givenPhoto: map['photo'],
                            givenFullName: map['username'],
                            givenHeader: map['header'],
                          );
                        },
                        openBuilder: (BuildContext context, VoidCallback _) {
                          final map = querySnapshot.docs[index].data();
                          return homeCardBook(
                              header: map['header'],
                              description: map['description'],
                              photo: map["photo"],
                              location: map['location'],
                              pickUpTimes: map["pickUpTimes"],
                              type: map["type"],
                              userUID: map["userUID"]);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('items')
                  .where("tag", isEqualTo: "cloth")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.red,
                    ),
                  );
                }
                print(snapshot.data);
                final QuerySnapshot querySnapshot = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  children: List.generate(
                    querySnapshot.docs.length,
                    (index) {
                      return OpenContainer(
                        openElevation: 0.0,
                        closedElevation: 0.0,
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: const Duration(milliseconds: 1000),
                        useRootNavigator: true,
                        closedBuilder:
                            (BuildContext context, VoidCallback openContainer) {
                          final map = querySnapshot.docs[index].data();
                          return homeCard1(
                            givenPhoto: map['photo'],
                            givenFullName: map['username'],
                            givenHeader: map['header'],
                          );
                        },
                        openBuilder: (BuildContext context, VoidCallback _) {
                          final map = querySnapshot.docs[index].data();
                          return homeCardCloth(
                            header: map['header'],
                            description: map["description"],
                            photo: map["photo"],
                            location: map["location"],
                            pickUpTimes: map["pickUpTimes"],
                            quantity: map["quantity"],
                            gender: map["gender"],
                            size: map["size"],
                            userUID: map["userUID"],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('items')
                  .where("tag", isEqualTo: "tech")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.red,
                    ),
                  );
                }
                print(snapshot.data);
                final QuerySnapshot querySnapshot = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  children: List.generate(
                    querySnapshot.docs.length,
                    (index) {
                      return OpenContainer(
                        openElevation: 0.0,
                        closedElevation: 0.0,
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: const Duration(milliseconds: 1000),
                        useRootNavigator: true,
                        closedBuilder:
                            (BuildContext context, VoidCallback openContainer) {
                          final map = querySnapshot.docs[index].data();
                          return homeCard1(
                            givenPhoto: map['photo'],
                            givenFullName: map['username'],
                            givenHeader: map['header'],
                          );
                        },
                        openBuilder: (BuildContext context, VoidCallback _) {
                          final map = querySnapshot.docs[index].data();
                          return homeCardTech(
                              header: map['header'],
                              description: map["description"],
                              photo: map["photo"],
                              location: map["location"],
                              pickUpTimes: map["pickUpTimes"],
                              type: map["type"],
                              userUID: map["userUID"]);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: !isSearching
            ? Text('')
            : TextField(
                decoration: InputDecoration(hintText: 'Search for items...'),
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
          onPressed: () {},
          color: Colors.teal,
          icon: Icon(
            Icons.location_on,
            size: 25.0,
          ),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.cancel),
                  iconSize: 30.0,
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  })
              : IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.search),
                  iconSize: 40.0,
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  }),
        ],
      ),
    );
  }
}
