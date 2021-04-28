import 'package:flutter/material.dart';
import 'package:ebuk_app/views/profile.dart';
import 'package:ebuk_app/views/dashboard.dart';
import 'package:ebuk_app/views/auth/register.dart';
import 'package:ebuk_app/views/auth/login.dart';
import 'package:ebuk_app/views/library/library.dart';
import 'package:ebuk_app/views/store/edit.dart';
import 'package:ebuk_app/views/store/library.dart';

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
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/library': (context) => Library(),
        '/store': (context) => StoreLibrary(),
        '/edit': (context) => EditPage(),
        '/profil': (context) => ProfilPage(),
      },
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
