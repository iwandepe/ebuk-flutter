import 'package:ebuk_app/views/pages/dashboard.dart';
import 'package:ebuk_app/views/pages/library/bookslibrary.dart';
import 'package:flutter/material.dart';

import 'package:ebuk_app/views/pages/register.dart';
import 'package:ebuk_app/views/pages/login.dart';

void main() {
  runApp(EbukApp());
}

class EbukApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebuk App',
      theme: ThemeData(
        primaryColor: Color(0xFF87B910),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      initialRoute: '/login',
      routes: {
        '/dashboard' : (context) => Dashboard(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/bookslibrary': (context) => BooksLibrary()
      },
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}