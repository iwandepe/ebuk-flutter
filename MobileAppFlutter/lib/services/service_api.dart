import 'dart:async';
import 'dart:convert';
import 'package:ebuk_app/models/book.dart';
import 'package:http/http.dart' as http;

String _apiKey = "AIzaSyDq51l2xaQFgsvWiP8ubYyy-x3jYQGL-mM";

Future<List<Book>> fetchBookByCategory() async {
  var url =
      "https://www.googleapis.com/books/v1/volumes?q=harry+potter+inauthor:rowling&key=AIzaSyDq51l2xaQFgsvWiP8ubYyy-x3jYQGL-mM";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return _parseBookJson(response.body);
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

List<Book> _parseBookJson(String jsonStr) {
  final jsonMap = jsonDecode(jsonStr);
  final jsonList = (jsonMap['items'] as List);
  return jsonList
      .map((jsonBook) => Book(
            title: jsonBook['volumeInfo']['title'],
            author: (jsonBook['volumeInfo']['authors'] as List).join(', '),
            thumbnailUrl: jsonBook['volumeInfo']['imageLinks'] != null
                ? jsonBook['volumeInfo']['imageLinks']['smallThumbnail']
                : null,
          ))
      .toList();
}
