import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kGreencolor = Color(0xFF18914C);
const kGrayColor = Color(0xFF5A5A5A);
const kLightGrayColor = Color(0xFF707070);

const kSFProRegular = TextStyle(
  fontFamily: 'SFProDisplay-Regular',
  fontWeight: FontWeight.bold,
);

const kSFProTextMedium = TextStyle(
  fontFamily: 'SFProText-Medium',
  fontSize: 17,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kSFProTextRegularRecentChat = TextStyle(
  color: kLightGrayColor,
  fontFamily: 'SFProText-Regular',
  fontSize: 15,
);

const kSFProTextRegular = TextStyle(
  fontFamily: 'SFProText-Regular',
  fontSize: 17,
);

const kSFProTextSemibold = TextStyle(
  fontFamily: 'SFProText-Semibold',
  color: Colors.black,
  fontSize: 17,
);

const kLocationIcon = Icon(
  Icons.location_on,
  color: kGreencolor,
  size: 20,
);

const kalphaGreen = Color(0xFF07914C);
const kbetaGreen = Color(0xFF168080);
const kbackgroundWhite = Color(0xFFFFFFFF);
const kbackgroundGrey = Color(0xFFF8F8F8);
const klikeAndCommentGrey = Color(0xFFACADB5);
const kForumRepliesGrey = Color(0xFF707070);

var textFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.teal[700],
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: new BorderRadius.circular(10.0),
    borderSide: new BorderSide(
      style: BorderStyle.solid,
    ),
  ),
);
