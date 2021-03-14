import 'package:flutter/cupertino.dart';

class BookDetail {
  final String title;
  final String subtitle;
  final String author;
  final String publisher;
  final String publishedDate;
  final String description;
  final String category;
  final double averageRating;
  final String imageUrl;

  BookDetail(
      {@required this.title,
      @required this.author,
      this.subtitle,
      this.publishedDate,
      this.publisher,
      this.description,
      this.category,
      this.averageRating,
      this.imageUrl})
      : assert(title != null),
        assert(author != null);
}
