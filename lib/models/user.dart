import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String email;

  User({@required this.name, @required this.email});

  User.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        email = data['email'];
}
