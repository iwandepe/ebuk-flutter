import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/views/pages/store/edit.dart';
import 'package:flutter/material.dart';
import 'package:ebuk_app/res/string.dart';

class DetailSell extends StatelessWidget {
  final BookSell bookSell;

  DetailSell({this.bookSell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
        actions: [
          FlatButton(
            child: Text('Edit'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPage(bookSell: bookSell)),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Image.network(noImageLinks)),
          Expanded(child: Text(bookSell.title)),
          Expanded(child: Text(bookSell.author)),
          Expanded(child: Text(bookSell.category)),
          Expanded(child: Text(bookSell.price)),
          Expanded(child: Text(bookSell.linkToImage)),
          Expanded(child: Text(bookSell.description)),
        ],
      ),
    );
  }
}
