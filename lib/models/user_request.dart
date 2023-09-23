import 'dart:convert';

import 'package:flutter_application_2/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class UserRequest {
  Future<List<User>> getAllUser() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode != 200) {
      return <User>[];
    }

    List userMap = jsonDecode(response.body);

    List<User> users = [];
    for (var user in userMap) {
      users.add(User.fromJson(user));
    }
    print("refreshed");

    return users;
  }
}