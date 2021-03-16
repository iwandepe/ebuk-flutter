import 'package:ebuk_app/views/pages/library/panel.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<String> categories = ['Computer', 'History', 'Medical', 'Sports'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Books Library'),
          bottom: TabBar(
            tabs: [
              Text(categories[0]),
              Text(categories[1]),
              Text(categories[2]),
              Text(categories[3]),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Panel(
              category: categories[0],
            ),
            Panel(
              category: categories[1],
            ),
            Panel(
              category: categories[2],
            ),
            Panel(
              category: categories[3],
            ),
          ],
        ),
      ),
    );
  }
}
