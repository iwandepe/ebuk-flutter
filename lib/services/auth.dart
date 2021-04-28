import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future login(BuildContext context, String email, String password) async {
  var url = "http://192.168.64.1/ebuk/api/login.php";
  var response =
      await http.post(url, body: {'email': email, 'password': password});

  var message = response.body;

  if (message == 'Login sukses') {
    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: email,
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          backgroundColor: Color(0xFFE5E5E5),
          actions: <Widget>[
            TextButton(
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

Future register(
    BuildContext context, String name, String email, String password) async {
  var url = "http://192.168.64.1/ebuk/api/register.php";
  var response = await http.post(url, body: {
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
            TextButton(
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
