import 'package:flutter/material.dart';

class Post {
  String contentHeader;
  DateTime contentDate;
  String contentWriting;
  String contentPhoto;
  String contentName;
  String contentLike;
  String contentComment;
  String contentPhotoOfSender;

  Post(
      {this.contentHeader,
      this.contentDate,
      this.contentWriting,
      this.contentPhoto,
      this.contentName,
      this.contentLike,
      this.contentComment,
      this.contentPhotoOfSender});
}
