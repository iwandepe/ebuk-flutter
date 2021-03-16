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
  print(jsonStr);
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