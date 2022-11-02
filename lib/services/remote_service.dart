import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:profiles/models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {}
  }

  getStus() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);

    return response.statusCode;
  }
}
