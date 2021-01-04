import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharify/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharify/signIn/entryPage.dart';
import 'package:sharify/signIn/signUpAddLocationAndPhoto.dart';

/// Profile page.
class profilePage extends StatefulWidget {
  // a code block to get current users user id.
  static final _auth = FirebaseAuth.instance;
  static final User user = _auth.currentUser;
  static final uid = user.uid;

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  /// Getting user datas with userUID from database
  Future giver() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(profilePage.uid)
        .get();

    userName = result.data()['userName'];
    userMail = result.data()['userMail'];
    userPhoto = result.data()['userPhoto'];
    userPhone = result.data()['userPhone'];
    userLocation = result.data()['location'];
    print(result.data()['userName']);
    print(result.data()['userPhoto']);
    print(result.data()['userMail']);
    print(result.data()['userPhone']);
    setState(() {
      // when it is no longer waiting for a response, it returns not the circular indicator but it returns scaffold.
      isLoading = true;
    });
  }

  String userName;
  String userPhone;
  String userMail;
  String userPhoto;
  String userLocation;
  // to check if awaiting response has came or not.
  bool isLoading = false;

  void initState() {
    super.initState();
    giver();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
                          GestureDetector(
                            // Signing out
                            onTap: () async {
                              FirebaseAuth.instance.signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => entryPage()));
                            },
                            child: RichText(
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
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                ],
                              ),
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
                              image: DecorationImage(
                                  image: NetworkImage(userPhoto),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
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
                          userName,
                          style: kSFProRegular.copyWith(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Creating tab in order to create both about and settings tab.
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
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
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 45, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Phone Number",
                                                style:
                                                    kSFProTextMedium.copyWith(
                                                  color: Color(0xFF8E8080),
                                                ),
                                              ),
                                              Text(
                                                userPhone,
                                                style:
                                                    kSFProTextRegular.copyWith(
                                                        color: Colors.black),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: kalphaGreen,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 45, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Location",
                                                style:
                                                    kSFProTextMedium.copyWith(
                                                  color: Color(0xFF8E8080),
                                                ),
                                              ),
                                              Text(
                                                userLocation,
                                                style:
                                                    kSFProTextRegular.copyWith(
                                                        color: Colors.black),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: kalphaGreen,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  ),
                                  Expanded(flex: 1, child: SizedBox()),
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
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 45, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "E-Mail",
                                                style:
                                                    kSFProTextMedium.copyWith(
                                                  color: Color(0xFF8E8080),
                                                ),
                                              ),
                                              Text(
                                                userMail,
                                                style:
                                                    kSFProTextRegular.copyWith(
                                                        color: Colors.black),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: kalphaGreen,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 45, 10),
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
                                                style:
                                                    kSFProTextMedium.copyWith(
                                                  color: Color(0xFF8E8080),
                                                ),
                                              ),
                                              Text(
                                                "**************",
                                                style:
                                                    kSFProTextRegular.copyWith(
                                                        color: Colors.black),
                                              )
                                            ],
                                          ),
                                          /*     Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: kalphaGreen,
                                                fontSize: 20),
                                          ), */
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  ),
                                  Expanded(flex: 1, child: SizedBox()),
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
            )),
      );
    }
  }
}
