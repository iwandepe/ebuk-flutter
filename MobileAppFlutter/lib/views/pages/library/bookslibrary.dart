import 'package:ebuk_app/views/pages/library/panel.dart';
import 'package:flutter/material.dart';

class BooksLibrary extends StatefulWidget {
  @override
  _BooksLibraryState createState() => _BooksLibraryState();
}

class _BooksLibraryState extends State<BooksLibrary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Books Library'),
          bottom: TabBar(
            tabs: [Text('1'), Text('2'), Text('3')],
          ),
        ),
        body: TabBarView(
          children: [Panel(), Panel(), Panel()],
        ),
      ),
    );
  }
}
