import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';
import 'package:sharify/Message/messageHomeScreen.dart';

class homeCardBook extends StatefulWidget {

  final String text='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar imperdiet feugiat. Integer non mauris tellus. Ut ultrices magna ut risus iaculis dignissim. Quisque venenatis justo quis nisl blandit semper. Morbi risus urna, euismod non justo vitae, imperdiet luctus justo. Curabitu...';
  bool isExpanded = false;

   homeCardBook(
      {@required this.header,
      this.userName,
      this.userUID,
      this.photo,
      this.location,
      this.pickUpTimes,
      this.expiryDate,
      this.quantity});

  final String header;
  final String expiryDate;
  final String location;
  final String photo;
  final String pickUpTimes;
  final String quantity;
  final String userUID;
  final String userName;

  @override
  _homeCardBookState createState() => _homeCardBookState();
}

class _homeCardBookState extends State<homeCardBook> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Card(
        elevation: 0.0, //Because this is a card there is a basic elevation.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Go Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           SizedBox(height: 20.0,),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nahta Oyunları'
                    /*widget.header*/,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  Text('November 12, 12 PM'
                    /*widget.pickUpTimes*/,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Column(children: <Widget>[
                new ConstrainedBox(
                    constraints: widget.isExpanded
                        ? new BoxConstraints()
                        : new BoxConstraints(maxHeight: 50.0),
                    child: new Text(
                      widget.text,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )),
                widget.isExpanded
                    ? new Container()
                    : new FlatButton(
                    child: const Text('See more...',
                      style: TextStyle(
                        color: kalphaGreen,
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () => setState(() => widget.isExpanded = true)
                )
              ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/yemek1.png'),
                    width: 299.0,
                    height: 172.0,
                  ),
                ),
              ),
            ),
            /*
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            */
            SizedBox(height: 25,),
            Expanded(
              flex: 3,
              child: Column(
                children:<Widget> [
                  Container(
                    child: Row(
                      children:<Widget>[
                      Image(
                        image: new AssetImage("assets/placeholder.png"),
                        color: null,
                        width: 20.49,
                        height: 25.71,
                            ),
                        SizedBox(
                          width: 15.0,
                        ),
                          Text(
                            'İstanbul (Anadolu)',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                       ],
                        ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Row(
                      children:<Widget>[
                        Image(
                          image: new AssetImage("assets/clock.png"),
                          color: null,
                          width: 20.49,
                          height: 25.71,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '14.00 - 17.00',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Row(
                      children:<Widget>[
                        Image(
                          image: new AssetImage("assets/hashtag.png"),
                          color: null,
                          width: 20.49,
                          height: 25.71,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Historical',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 5,
                          child: Text(
                            widget.userName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 30.0),
                          child: Expanded(
                            flex: 5,
                            child: Container(
                              child: FlatButton(
                                height: 10.0,
                                child: Center(
                                  child: Text(
                                    "Send Message",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            decoration: BoxDecoration(
                              color:kalphaGreen,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                           ),
                          ),
                        ),
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
