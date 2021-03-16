import 'package:flutter/cupertino.dart';

class Book {
  final String title;
  final String selfLink;
  final String thumbnailUrl;

  Book({@required this.title, @required this.selfLink, this.thumbnailUrl});
}
