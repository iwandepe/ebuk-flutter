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

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}