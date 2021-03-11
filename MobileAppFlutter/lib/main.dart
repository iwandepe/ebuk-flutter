import 'package:ebuk_app/views/login_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(EbukApp());

class EbukApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebuk App',
      theme: ThemeData(
        primaryColor: Color(0xFF87B910),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
