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
        appBar: AppBar(title: Text('Book Store')),
        body: Text("dumb"),
      ),
    );
  }
}