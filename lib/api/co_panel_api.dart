import 'package:http/http.dart' as http;
import 'package:policesystem/model/co_model.dart';

Future<List<Co>> fetchCo() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/co");
  final response = await http.get(url);
  return CoFromJson(response.body);
}
