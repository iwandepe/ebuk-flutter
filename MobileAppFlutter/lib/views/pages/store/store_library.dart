import 'package:ebuk_app/views/pages/store/add.dart';
import 'package:ebuk_app/views/pages/store/panel.dart';
import 'package:flutter/material.dart';

class StoreLibrary extends StatefulWidget {
  @override
  _StoreLibraryState createState() => _StoreLibraryState();
}

class _StoreLibraryState extends State<StoreLibrary> {
  final categories = ['Novel', 'Sejarah', 'Self Improvement', 'Biografi'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Books Store'),
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
            Panel(category: categories[0]),
            Panel(category: categories[1]),
            Panel(category: categories[2]),
            Panel(category: categories[3]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
        ),
      ),
    );
  }
}
