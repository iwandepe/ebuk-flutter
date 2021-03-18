import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future login(BuildContext context, String email, String password) async {
  var response = await http.post(
      "http://iwandepee.000webhostapp.com/ebuk/api/login.php",
      body: {'email': email, 'password': password});

  var message = response.body;

  if (message == 'Login sukses') {
    Navigator.pushNamed(context, '/dashboard');
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          backgroundColor: Color(0xFFE5E5E5),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Future<List> signup(BuildContext context, String name, String email, String password) async {

    var response =
        await http.post("http://iwandepee.000webhostapp.com/ebuk/api/register.php", body: {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(response.body),
            backgroundColor: Color(0xFFE5E5E5),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      print(response.statusCode);
    }
  }
