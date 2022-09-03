import 'dart:convert';

import '../model/pick_panel_model.dart';
import 'package:http/http.dart' as http;

class Pick_panelApi {
  static final host = "http://127.0.0.1:8000/api/applicants";

  static getHost() {
    return host;
  }

  static Future<List<User>> getUser() async {
    // List<User> user = []
    // for(var i = 0; i < 10; i++){
    //   user.add(User(
    //     id: i , firstname: "First", middlename: "middle", lastname: "last", contact_no: '31434', date_of_birth: '12/01/01', place_of_birth: "sun",civil_status: "single", height: '5ft4', sex: "male", nationality: "fil", address: "zwqeqwe qweqwe")
    //   );
    // }
    try {
      final response = await http.get(Uri.parse("$host"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<User>((json) => User.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

    
}
