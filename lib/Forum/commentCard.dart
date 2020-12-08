import 'package:flutter/material.dart';

class commentCard extends StatelessWidget {
  const commentCard(
      {@required this.commentatorName,
      this.commentatorPhoto,
      this.commentatorDate,
      this.commentatorComment});
  final String commentatorName;
  final String commentatorPhoto;
  final String commentatorDate;
  final String commentatorComment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(commentatorPhoto),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(commentatorName),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          commentatorDate.toString(),
                          style: TextStyle(
                            fontSize: 8.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Text(
                commentatorComment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
