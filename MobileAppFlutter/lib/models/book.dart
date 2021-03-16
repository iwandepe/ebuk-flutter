import 'package:flutter/cupertino.dart';

class Book {
  final String title;
  final String thumbnailUrl;

  Book({@required this.title, this.thumbnailUrl})
      : assert(title != null);
}
