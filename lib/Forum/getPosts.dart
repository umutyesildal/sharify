import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'postCard.dart';
import 'postDetails.dart';
import '';

class getPosts extends StatefulWidget {
  @override
  _getPostsState createState() => _getPostsState();
}

class _getPostsState extends State<getPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
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
                            return postCard(
                              forumBaslik: "Huge Istanbul 'Kermes'",
                              forumTarih: DateTime.now(),
                              forumIcerikYazi:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar imperdiet feugiat. Integer non mauris tellus. Ut ultrices magna ut risus iaculis dignissim. Quisque venenatis justo quis nisl blandit semper. Morbi risus urna, euismod non justo vitae, imperdiet luctus justo ",
                              forumIcerikFoto: "assets/forumFoto.png",
                              forumPaylasanKisi: "Umut Yeşildal",
                              forumPaylasanFoto: "assets/russianGuy.jpg",
                              forumBegeni: "100",
                              forumYorum: "250",
                            );
                          },
                          openBuilder: (BuildContext context, VoidCallback _) {
                            return postDetails(
                                forumBaslik: "Huge Istanbul 'Kermes'",
                                forumTarih: DateTime.now(),
                                forumIcerikYazi:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar imperdiet feugiat. Integer non mauris tellus. Ut ultrices magna ut risus iaculis dignissim. Quisque venenatis justo quis nisl blandit semper. Morbi risus urna, euismod non justo vitae, imperdiet luctus justo ",
                                forumIcerikFoto: "assets/forumFoto.png",
                                forumPaylasanKisi: "Umut Yeşildal",
                                forumPaylasanFoto: "assets/russianGuy.jpg",
                                forumBegeni: "100",
                                forumYorum: "250");
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                      itemCount: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
