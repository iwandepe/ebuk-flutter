import 'package:ebuk_app/views/pages/store/add.dart';
import 'package:ebuk_app/views/pages/store/panel.dart';
import 'package:flutter/material.dart';

class StoreLibrary extends StatefulWidget {
  @override
  _StoreLibraryState createState() => _StoreLibraryState();
}

class _StoreLibraryState extends State<StoreLibrary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Books Store'),
          bottom: TabBar(
            tabs: [Text('1'), Text('2'), Text('3')],
          ),
        ),
        body: TabBarView(
          children: [Panel(), Panel(), Panel()],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPage()),
            );
          },
        ),
      ),
    );
  }
}
