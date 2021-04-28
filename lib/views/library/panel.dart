import 'package:flutter/material.dart';
import 'package:ebuk_app/res/string.dart';
import 'package:ebuk_app/services/google_api.dart';
import 'package:ebuk_app/views/library/detail.dart';
import 'package:ebuk_app/models/book.dart';

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
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          children: snapshot.data
              .map<Widget>(
                (data) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(selfLink: data.selfLink)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: AspectRatio(
                            aspectRatio: 0.8,
                            child: data.thumbnailUrl != null
                                ? Image.network(
                                    data.thumbnailUrl,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(noImageLinks),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              data.title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
