import 'package:flutter/material.dart';

import 'package:ebuk_app/models/book_detail.dart';
import 'package:ebuk_app/res/string.dart';
import 'package:ebuk_app/services/google_api.dart';

class BookDetailPage extends StatefulWidget {
  final String selfLink;

  BookDetailPage({this.selfLink});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  Future<BookDetail> bookDetail;

  @override
  void initState() {
    super.initState();
    bookDetail = fetchBookById(widget.selfLink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Detail')),
      body: Center(
        child: FutureBuilder<BookDetail>(
          future: bookDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: snapshot.data.imageUrl != null
                              ? Image.network(snapshot.data.imageUrl)
                              : Image.network(noImageLinks),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data.title != null
                                ? snapshot.data.title
                                : '',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data.subtitle != null
                                ? snapshot.data.subtitle
                                : '',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Publisher:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.publisher != null
                                      ? snapshot.data.publisher
                                      : '-',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Published Date:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.publishedDate != null
                                      ? snapshot.data.publishedDate
                                      : '-',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Average Rating:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.averageRating != null
                                      ? snapshot.data.averageRating.toString()
                                      : '',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Category:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.category != null
                                      ? snapshot.data.category
                                      : '',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.description != null
                                      ? snapshot.data.description
                                      : '',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.hasError}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
