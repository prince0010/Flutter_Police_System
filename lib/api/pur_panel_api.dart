import 'package:http/http.dart' as http;
import 'package:policesystem/model/pur_model.dart';

Future<List<Pur>> fetchPur() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/purposes");
  final response = await http.get(url);
  return purFromJson(response.body);
}
