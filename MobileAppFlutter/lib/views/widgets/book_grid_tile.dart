import 'package:ebuk_app/views/pages/library/detail.dart';
import 'package:flutter/material.dart';

class BookGridTile extends StatelessWidget {
  final String title;
  final String selfLink;
  final String thumbnailUrl;

  BookGridTile(
      {@required this.title, @required this.selfLink, this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailPage(selfLink: selfLink)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4),
        color: Color(0xFFE5E5E5),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.6,
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
