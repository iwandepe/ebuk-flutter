import 'package:ebuk_app/models/book_detail.dart';
import 'package:ebuk_app/res/string.dart';
import 'package:flutter/material.dart';
import 'package:ebuk_app/services/service_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookDetailPage extends StatefulWidget {
  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage>{
  Future<BookDetail> bookDetail;

  @override
  void initState() {
    super.initState();
    bookDetail = fetchBookById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Detail')),
      body: FutureBuilder<BookDetail>(
        future: bookDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(child: Image.network(noImageLinks)),
                // Expanded(child: Text(snapshot.data.title)),
                Expanded(child: Text('Hello')),
                Expanded(child: Text('Hello')),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}