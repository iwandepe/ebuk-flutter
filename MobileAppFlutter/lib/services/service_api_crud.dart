import 'dart:async';
import 'dart:convert';
import 'package:ebuk_app/models/book_sell.dart';
import 'package:http/http.dart' as http;

Future<List<BookSell>> fetchBookSellByCategory() async {
  var url = "http://iwandepee.000webhostapp.com/ebuk/api/show.php";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return _parseBookSellJson(response.body);
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

List<BookSell> _parseBookSellJson(String jsonStr) {
  final jsonMap = jsonDecode(jsonStr);
  final jsonList = jsonMap as List;
  return jsonList
      .map((jsonBook) => BookSell(
            id: int.parse(jsonBook['id']),
            title: jsonBook['title'],
            author: jsonBook['author'],
            category: jsonBook['category'],
            price: jsonBook['price'],
            linkToImage: jsonBook['linkToImage'],
            description: jsonBook['description'],
          ))
      .toList();
}

Future<String> createBookJson(
  int id,
  String title,
  String author,
  String category,
  String price,
  String linkToImage,
  String description,
) async {
  var url = 'http://iwandepee.000webhostapp.com/ebuk/api/edit.php';
  final response = await http.post(
    url,
    headers: {"content-type": "application/json"},
    body: jsonEncode(
      <String, String>{
        'submit': 'true',
        'id': '3',
        'title': title,
        'author': author,
        'category': category,
        'price': price,
        'linkToImage': linkToImage,
        'description': description,
      },
    ),
  );

  if (response.statusCode == 200) {
    print('edit 200');
    return response.body;
  } else if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

Future<String> addBook(
  int id,
  String title,
  String author,
  String category,
  String price,
  String linkToImage,
  String description,
) async {
  var url = 'http://iwandepee.000webhostapp.com/ebuk/api/add.php';
  final response = await http.post(
    url,
    headers: {"content-type": "application/json"},
    body: jsonEncode(
      <String, String>{
        'submit': 'true',
        'title': title,
        'author': author,
        'category': category,
        'price': price,
        'linkToImage': linkToImage,
        'description': description,
      },
    ),
  );

  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

Future<String> deleteBook(int id) async {
  final url = 'http://iwandepee.000webhostapp.com/ebuk/api/delete.php';
  final response = await http.post(
    url,
    body: jsonEncode(
      <String, String>{'id': '$id'},
    ),
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}
