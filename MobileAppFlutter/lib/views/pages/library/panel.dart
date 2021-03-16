import 'package:ebuk_app/models/book.dart';
import 'package:ebuk_app/res/string.dart';
import 'package:ebuk_app/services/service_api.dart';
import 'package:ebuk_app/views/widgets/book_grid_tile.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final String category;

  Panel({this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: fetchBookByCategory(category),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          children: snapshot.data
              .map((data) => BookGridTile(
                    title: data.title,
                    selfLink: data.selfLink,
                    thumbnailUrl: data.thumbnailUrl != null
                        ? data.thumbnailUrl
                        : noImageLinks,
                  ))
              .toList(),
        );
      },
    );
  }
}
