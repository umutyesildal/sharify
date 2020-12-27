import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/constants.dart';

class profilePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "profile",
                        style: kSFProRegular.copyWith(
                            fontSize: 30, color: kGrayColor),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.login,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: " Log Out ",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0x33707070), shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  child: Center(
                    child: Text(
                      "Victor Niculici",
                      style: kSFProRegular.copyWith(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: TabBar(
                        indicatorColor: kalphaGreen,
                        tabs: [
                          Tab(
                            child: Text(
                              "about",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Tab(
                              child: Text(
                            "settings",
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ))
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        Scaffold(
                          backgroundColor: Colors.white,
                          body: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 45, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Phone Number",
                                            style: kSFProTextMedium.copyWith(
                                              color: Color(0xFF8E8080),
                                            ),
                                          ),
                                          Text(
                                            "+905545731484",
                                            style: kSFProTextRegular.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: kalphaGreen, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 45, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Adress",
                                            style: kSFProTextMedium.copyWith(
                                              color: Color(0xFF8E8080),
                                            ),
                                          ),
                                          Text(
                                            "+905545731484",
                                            style: kSFProTextRegular.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: kalphaGreen, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "any suggestions ?",
                                    style: TextStyle(
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Scaffold(
                          backgroundColor: Colors.white,
                          body: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 45, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mail",
                                            style: kSFProTextMedium.copyWith(
                                              color: Color(0xFF8E8080),
                                            ),
                                          ),
                                          Text(
                                            "umutyesildal@gmail.com",
                                            style: kSFProTextRegular.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: kalphaGreen, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 45, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Password",
                                            style: kSFProTextMedium.copyWith(
                                              color: Color(0xFF8E8080),
                                            ),
                                          ),
                                          Text(
                                            "burayanoktaligelcek.",
                                            style: kSFProTextRegular.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: kalphaGreen, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Delete Account",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
