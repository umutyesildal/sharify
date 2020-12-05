import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'imageDialog.dart';
import 'package:animations/animations.dart';

class postCard extends StatelessWidget {
  const postCard(
      {@required this.forumBaslik,
      this.forumTarih,
      this.forumIcerikYazi,
      this.forumIcerikFoto,
      this.forumPaylasanKisi,
      this.forumBegeni,
      this.forumYorum,
      this.forumPaylasanFoto});

  final String forumBaslik;
  final DateTime forumTarih;
  final String forumIcerikYazi;
  final String forumIcerikFoto;
  final String forumPaylasanKisi;
  final String forumBegeni;
  final String forumYorum;
  final String forumPaylasanFoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 2 / 5,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15.0)),
      child: Card(
        elevation: 0.0, //Because this is a card there is a basic elevation.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                forumBaslik,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                forumTarih.toString(),
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                forumIcerikYazi.substring(0, 160) + "...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(forumIcerikFoto), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (_) => ImageDialog(
                            sentPhoto: forumIcerikFoto,
                          ));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(forumPaylasanFoto),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              forumPaylasanKisi,
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.favorite,
                            size: 12,
                            color: klikeAndCommentGrey,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              forumBegeni,
                              style: TextStyle(
                                  fontSize: 12, color: klikeAndCommentGrey),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.comment,
                            size: 12,
                            color: klikeAndCommentGrey,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              forumYorum,
                              style: TextStyle(
                                  fontSize: 12, color: klikeAndCommentGrey),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
