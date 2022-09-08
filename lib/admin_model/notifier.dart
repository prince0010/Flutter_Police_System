import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show PaginatedDataTable;
import 'package:http/http.dart' as http;
import 'package:policesystem/admin_model/police_model.dart';

class UserDataNotifier with ChangeNotifier {
  UserDataNotifier() {
    fetchPolice();
  }

  List<Police> get userModel => _PoliceModel;

  var _PoliceModel = <Police>[];

  Future<void> fetchPolice() async {
    _PoliceModel = (await http
        .get(Uri.parse('http://127.0.0.1:8000/api/police'))) as List<Police>;
    notifyListeners();
  }
}
