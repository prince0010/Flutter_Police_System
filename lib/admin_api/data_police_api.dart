// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:policesystem/admin_model/police_data_model.dart';

// Future<List<DataPolice>> fetchDataPolice() async {
//   var url = 'http://127.0.0.1:8000/api/police';
//   var result = await http.get(Uri.parse(url));
//   if (result.statusCode == 200) {
//     var parsed = json.decode(result.body);
//     return parsed.map<DataPolice>((job) => DataPolice.fromJson(job)).toList();
//   } else {
//     throw Exception('Failed to Connect');
//   }
// }
// //Calling the object of data from the json file

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:policesystem/admin_model/police_data_model.dart';

const _url = 'http://127.0.0.1:8000/api/police';

class PoliceDataApi {
  PoliceDataApi._();

  static Future<List<DataPolice>> fetchDataPolice() async {
    //
    final _completer = Completer<List<DataPolice>>();

    try {
      final resp = await http.get(Uri.parse(_url));

      if (resp.statusCode == 200) {
        //
        final _data = policeModelFromJson(resp.body);
        _completer.complete(_data);
      }
    } catch (exc) {
      _completer.completeError(<DataPolice>[]);
    }

    return _completer.future;
  }
}
