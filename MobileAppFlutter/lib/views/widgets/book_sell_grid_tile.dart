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
          MaterialPageRoute(
              builder: (context) => DetailSell(bookSell: bookSell)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4),
        color: Color(0xFFE5E5E5),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.6,
                child: Image.network(bookSell.linkToImage, fit: BoxFit.cover),
              ),
            ),
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
