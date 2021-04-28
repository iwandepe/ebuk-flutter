import 'dart:async';
import 'dart:convert';
import 'package:ebuk_app/models/user.dart';
import 'package:http/http.dart' as http;

Future<String> fetchProfile(String email) async {
  var url = "http://192.168.64.1/ebuk/api/profile.php?email=$email";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    var user = User.fromJson(parsedJson);
    return user.name;
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}
