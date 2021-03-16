import 'package:ebuk_app/res/string.dart';
import 'package:ebuk_app/views/pages/library/detail.dart';
import 'package:flutter/material.dart';

class BookGridTile extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnailUrl;

  BookGridTile(
      {@required this.title, @required this.author, this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailPage()),
        );
      },
      child: Column(
        children: [
          Expanded(child: Image.network(noImageLinks)),
          Expanded(child: Text(title)),
          Expanded(child: Text(author)),
        ],
      ),
    );
  }
}
