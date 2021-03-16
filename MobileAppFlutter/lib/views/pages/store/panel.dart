import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/pages/store/edit.dart';
import 'package:ebuk_app/views/widgets/book_sell_grid_tile.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookSell>>(
      future: fetchBookSellByCategory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return GridView.count(
          crossAxisCount: 3,
          children:
              snapshot.data.map((data) => BookSellGridTile(bookSell: data,)).toList(),
        );
      },
    );
  }
}
