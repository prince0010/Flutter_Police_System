// import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:policesystem/model/zone_model.dart';
// import 'package:policesystem/admin_model/police_model.dart';

// Future<List<Police>> fetchPolice() async {
//   var url = 'http://127.0.0.1:8000/api/police';
//   var result = await http.get(Uri.parse(url));
//   if (result.statusCode == 200) {
//     var parsed = json.decode(result.body);
//     return parsed.map<Police>((job) => Police.fromJson(job)).toList();
//   } else {
//     throw Exception('Failed to Connect');
//   }
// }

Future<List> fetchZone() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/applicants");
  final response = await http.get(url);
  return zoneFromJson(response.body);
}
