import 'dart:async';
import 'dart:convert';
import 'package:ebuk_app/models/book.dart';
import 'package:ebuk_app/models/book_detail.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> fetchBookByCategory() async {
  var url = 
      "https://www.googleapis.com/books/v1/volumes?q=subject:school&maxResults=40&key=AIzaSyDq51l2xaQFgsvWiP8ubYyy-x3jYQGL-mM";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return _parseBookJson(response.body);
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

Future<BookDetail> fetchBookById() async {
  var url = 
      "https://www.googleapis.com/books/v1/volumes/zyTCAlFPjgYC?key=AIzaSyDq51l2xaQFgsvWiP8ubYyy-x3jYQGL-mM";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return _parseBookDetailJson(response.body);
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
            thumbnailUrl: jsonBook['volumeInfo']['imageLinks'] != null
                ? jsonBook['volumeInfo']['imageLinks']['smallThumbnail']
                : null,
          ))
      .toList();
}

BookDetail _parseBookDetailJson(String jsonStr) {
  final jsonMap = jsonDecode(jsonStr);
  final jsonBookDetail = jsonMap['volumeInfo'];
  return BookDetail(
      title: jsonBookDetail['title'],
      author: (jsonBookDetail['authors'] as List).join(', '),
      subtitle: jsonBookDetail['subtitle'],
      averageRating: jsonBookDetail['averageRating'],
      category: (jsonBookDetail['categories'] as List).join(', '),
      description: jsonBookDetail['description'],
      imageUrl: jsonBookDetail['imageLinks'] != null
          ? jsonBookDetail['imageLinks']['small']
          : null,
      publisher: jsonBookDetail['publisher']);
}
