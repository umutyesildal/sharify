import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'postCard.dart';
import 'postDetails.dart';
import 'package:sharify/Forum/addNewPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getPosts extends StatefulWidget {
  @override
  _getPostsState createState() => _getPostsState();
}

class _getPostsState extends State<getPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => addNewPost()),
        ),
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: kbetaGreen,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Scaffold(
                  body: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('forum')
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
                      return Container(
                        color: kbackgroundGrey,
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return OpenContainer(
                                openElevation: 0.0,
                                closedElevation: 0.0,
                                transitionType: ContainerTransitionType.fade,
                                transitionDuration:
                                    const Duration(milliseconds: 1000),
                                useRootNavigator: true,
                                closedBuilder: (BuildContext context,
                                    VoidCallback openContainer) {
                                  final map = querySnapshot.docs[index].data();
                                  return postCard(
                                    forumUserUID: map['userUID'],
                                    forumBaslik: map['header'],
                                    forumTarih: DateTime.now(),
                                    forumIcerikYazi: map['content'],
                                    forumIcerikFoto: map['contentPhoto'],
                                  );
                                },
                                openBuilder:
                                    (BuildContext context, VoidCallback _) {
                                  final map = querySnapshot.docs[index].data();
                                  return postDetails(
                                      forumBaslik: map['header'],
                                      forumTarih: DateTime.now(),
                                      forumIcerikYazi: map['content'],
                                      forumIcerikFoto: map['contentPhoto'],
                                      forumPaylasanKisi: map['personName'],
                                      forumPaylasanFoto: map['personPhoto'],
                                      forumBegeni: "100",
                                      forumYorum: "250");
                                },
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                    int index) =>
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                            itemCount: querySnapshot.docs.length),
                      );
                    },
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
