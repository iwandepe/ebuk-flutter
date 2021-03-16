import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
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
                MaterialPageRoute(
                    builder: (context) => EditPage(bookSell: bookSell)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Future.delayed(Duration.zero, () async {
            deleteBook(bookSell.id).then((value) => Navigator.pop(context));
          });
        },
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(noImageLinks),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bookSell.title,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'author    : ${bookSell.author}',
                  style: Theme.of(context).textTheme.overline,
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'category : ${bookSell.category}',
                  style: Theme.of(context).textTheme.overline,
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'price      : ${bookSell.price}',
                  style: Theme.of(context).textTheme.overline,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bookSell.description,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
