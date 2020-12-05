import 'package:flutter/material.dart';
import 'commentCard.dart';
import 'constants.dart';
import 'postDetails.dart';

class fullCommentPage extends StatefulWidget {
  @override
  _fullCommentPageState createState() => _fullCommentPageState();
}

class _fullCommentPageState extends State<fullCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Replies (200)",
          style: TextStyle(color: klikeAndCommentGrey),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: ListView(
        itemExtent: 150,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            commentCard(
              commentatorName: "Umut Yunus Yeşildal",
              commentatorComment:
                  "Bu kermes inşAllah herkes için hayırlı olur, Allah'ın izniyle.",
              commentatorDate: DateTime.now().toString(),
              commentatorPhoto: "assets/happyMan.jpg",
            ),
            commentCard(
              commentatorName: "Kamil Uğur Sarp",
              commentatorComment:
                  "Kermesi iple çekiyorum. Havuçlu kek çok severim umarım bir dilim bulabilirim!",
              commentatorDate: DateTime.now().toString(),
              commentatorPhoto: "assets/happyMan2.jpg",
            ),
            commentCard(
              commentatorName: "Aysu Aksu",
              commentatorComment:
                  "Ordunun derelerii akarrrrr. Kermeste umarım ordudan birilerini bulabilirimm.",
              commentatorDate: DateTime.now().toString(),
              commentatorPhoto: "assets/happyWoman.jpg",
            ),
            commentCard(
              commentatorName: "Sümeyye Özel",
              commentatorComment:
                  "Kermes çok güzel ama ben erasmusa gidemedim.",
              commentatorDate: DateTime.now().toString(),
              commentatorPhoto: "assets/happyWoman2.jpg",
            ),
            commentCard(
              commentatorName: "Mutlu Yıldız",
              commentatorComment: "Arkadaşlar 5 yıla çok zengin olcam.",
              commentatorDate: DateTime.now().toString(),
              commentatorPhoto: "assets/russianGuy.jpg",
            ),
          ],
        ).toList(),
      ),
    );
  }
}
