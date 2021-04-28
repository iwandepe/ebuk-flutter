import 'package:ebuk_app/models/my_book.dart';
import 'package:ebuk_app/services/crud_api.dart';
import 'package:ebuk_app/views/store/edit.dart';
import 'package:flutter/material.dart';

class DetailSell extends StatelessWidget {
  final MyBook myBook;

  DetailSell({this.myBook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
        actions: [
          TextButton(
            child: Text('Edit', style: Theme.of(context).textTheme.subtitle2),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage(myBook: myBook)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Future.delayed(Duration.zero, () async {
            deleteBook(myBook.id).then((value) => Navigator.pop(context));
          });
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(height: 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(myBook.linkToImage),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    myBook.title,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'author     : ${myBook.author}',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'category : ${myBook.category}',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'price        : Rp. ${myBook.price},-',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    myBook.description,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
