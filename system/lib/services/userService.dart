// //This is for function in table gikan sa repository.dart

// import 'package:system/admin_part/DatabaseHandler/repository.dart';
// import 'package:system/admin_part/Model/userModel.dart';

// class UserService {
//   late Repository _repository;

//   UserService() {
//     _repository = Repository();
//   }

//   SaveUser(UserModel user) async {
//     //Kwaon gikan sa UserModel.dart
//     return await _repository.insertData("admin", user.userMap());
//   }

//   readAllUsers() {}
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:system/Model/userModel.dart';

class UserService {
  const UserService();

  static const baseURL = 'http://127.0.0.1:8000/';
  Future<bool> login(String username, String password) async {
    var url = UserService.baseURL;

    final response = await http.post(Uri.parse(url + 'api/auth/login'),
        body: ({'username': username, 'password': password}));
    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body);
      // if (json['status'] == 'ok'){

      // }
      print("Successing");
      return true;
    } else {
      throw Exception("Failed to load");
    }
  }
}
