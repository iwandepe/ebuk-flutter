import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/views/pages/store/store_detail.dart';
import 'package:flutter/material.dart';

class BookSellGridTile extends StatelessWidget {
  final BookSell bookSell;

  BookSellGridTile({this.bookSell});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailSell(bookSell: bookSell)),
        );
      },
      child: Column(
        children: [
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
