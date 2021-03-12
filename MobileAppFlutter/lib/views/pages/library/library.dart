import 'package:ebuk_app/views/pages/library/panel.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
