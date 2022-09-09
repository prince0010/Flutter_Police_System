import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:policesystem/model/home_model.dart';

Future<List<User>> fetchUserist() async {
  var url = 'http://127.0.0.1:8000/api/users';
  var result = await http.get(Uri.parse(url));
  if (result.statusCode == 200) {
    var parsed = json.decode(result.body);
    return parsed.map<User>((job) => User.fromJson(job)).toList();
  } else {
    throw Exception('Failed');
  }
}
