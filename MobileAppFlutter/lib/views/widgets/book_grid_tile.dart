import 'package:ebuk_app/res/string.dart';
import 'package:ebuk_app/views/pages/library/detail.dart';
import 'package:flutter/material.dart';

class BookGridTile extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  BookGridTile(
      {@required this.title, this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4),
        color: Colors.greenAccent,
        child: Column(
          children: [
            Expanded(child: Image.network(thumbnailUrl)),
            Text(
              title,
              style: Theme.of(context).textTheme.overline,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
