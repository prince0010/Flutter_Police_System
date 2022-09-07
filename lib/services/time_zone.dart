import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String url;
  String flag;

  WorldTime(
      {required this.location,
      required this.time,
      required this.url,
      required this.flag});

  Future<void> getTime() async {
    try {
      //get pproperties from data
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone'));
      Map data = jsonDecode(response.body);

      String datetime = data['dataTime'];
      String offset = data['dataTime'].subString(1, 3);

      //Create Datatime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caugit Caought: $e');
      time = 'Could not get its';
    }
  }
}
