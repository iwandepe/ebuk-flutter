import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/res/string.dart';
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
          MaterialPageRoute(
              builder: (context) => DetailSell(bookSell: bookSell)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(3),
        color: Colors.greenAccent,
        child: Column(
          children: [
            Expanded(child: Image.network(bookSell.linkToImage)),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                bookSell.title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
