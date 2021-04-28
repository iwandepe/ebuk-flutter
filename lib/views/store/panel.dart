import 'package:ebuk_app/models/my_book.dart';
import 'package:ebuk_app/services/crud_api.dart';
import 'package:ebuk_app/views/store/detail.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final String category;

  Panel({this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyBook>>(
      future: fetchMyBookByCategory(category),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          children: snapshot.data
              .map((data) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailSell(myBook: data)),
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
                              child: Image.network(data.linkToImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              data.title,
                              style: Theme.of(context).textTheme.subtitle2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Rp. ${data.price},-",
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
