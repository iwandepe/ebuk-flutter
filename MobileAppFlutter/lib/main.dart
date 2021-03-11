import 'package:flutter/material.dart';

import 'package:ebuk_app/views/register_view.dart';
import 'package:ebuk_app/views/login_view.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register()
      },
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}