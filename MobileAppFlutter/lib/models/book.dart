import 'package:flutter/cupertino.dart';

class Book {
  final String title;
  final String author;
  final String thumbnailUrl;

  Book({@required this.title, @required this.author, this.thumbnailUrl})
      : assert(title != null),
        assert(author != null);
}
