import 'dart:async';
import 'dart:convert';
import 'package:ebuk_app/models/books_library.dart';
import 'package:http/http.dart' as http;


String _apiKey = "AIzaSyDq51l2xaQFgsvWiP8ubYyy-x3jYQGL-mM";


Future<List<String>> getBookIds() async {

  var response = await http.get("https://www.googleapis.com/books/v1/volumes?q=helo&key=${_apiKey}");

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    BooksLibrary booksLibrary = BooksLibrary.fromJson(json);

    var volumeIds = booksLibrary.volumeIds;
    if (volumeIds != null){
      List<String> bookIds = volumeIds?.map((e) => e.id)?.toList();
      return bookIds;
    }
    
    return null;
  } else {
    throw Exception('Failed to load data');
  }
}